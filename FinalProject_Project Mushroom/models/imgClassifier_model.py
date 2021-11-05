import torch
import torch.nn as nn
import torch.nn.functional as F
from PIL import Image
import torchvision
from torch.utils.data import DataLoader
import joblib

from torchvision import transforms
import requests
from bs4 import BeautifulSoup
class imgClassifierService:
    def getResult(self, inputImage):
        trans = transforms.Compose([transforms.Resize((32, 32)),
                                    transforms.ToTensor(),
                                    transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))
                                    ])
        imageData = torchvision.datasets.ImageFolder(root="static/uploads/", transform=trans)
        testImageloader = DataLoader(imageData,
                                     batch_size=1,
                                     shuffle=False,
                                     num_workers=1)
        dataiter = iter(testImageloader)
        images, labels = dataiter.next()
        classes = ['Agaricus',
                   'Amanita',
                   'Boletus',
                   'Cortinarius',
                   'Entoloma',
                   'Hygrocybe',
                   'Lactarius',
                   'Russula',
                   'Suillus']
        net = joblib.load("mushroom_test.pkl")
        outputs = net(images)
        _, predicted = torch.max(outputs, 1)
        result = (classes[predicted])
        return result

    # 분류 된 결과와 관련된 추가 정보를 공공데이터 OPEN_API를 통해 불러오는 메서드
    def searchMushInfo(self, sw):
        sw = sw
        api_Key = ''
        url = 'http://openapi.nature.go.kr/openapi/service/rest/FungiService/fngsIlstrSearch?ServiceKey=' + api_Key
        url += '&st=2'
        url += '&sw=' + sw
        url += '&numOfRows=5&PageNo=1'

        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('resultCode').text
        resultMsg = root.find("resultMsg").text
        results = []

        if code == "00":
            print("API Loading Complete!!")
            items = root.select("item")
            for item in items:
                imgUrl = item.find("imgUrl").text
                genusKorNm = item.find("genusKorNm").text
                genusNm = item.find("genusNm").text
                fngsGnrlNm = item.find("fngsGnrlNm").text

                results.append([imgUrl, genusKorNm, genusNm, fngsGnrlNm])
            return results

        else:
            print("API Loading Failed...")
            print("API Load ErrorCode: ", code)
            print("API Load Error Message: ", resultMsg)

            return None