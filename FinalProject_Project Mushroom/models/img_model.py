import requests
from bs4 import BeautifulSoup



class ImageList:
    def __init__(self, searchWord=None, pageIndex=None):
        # 검색어
        self.searchWord = searchWord
        # 선택페이지
        self.pageIndex = pageIndex

class Service:
    def __init__(self):
        self.base_url ='http://apis.data.go.kr/1390804/NihhsMushroomImageInfo/'
        self.api_key = ''

    # 이미지 포함 검색
    def imgSearch(self, pageIndex, searchWord):
        cmd = 'selectMushroomImageList'
        url = self.base_url + cmd + '?pageIndex=' + pageIndex + '&serviceKey=' + self.api_key + '&searchWord=' + searchWord
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('resultCode').get_text()
        resultMsg = root.find('resultMsg').text
        results = []

        if code == '1': # 출력부에서 받아오는 부분(응답메세지에서 가져오는)
            items = root.select('result')
            for item in items:
                # 버섯명(국문)
                scNameKr = item.find('scNameKr').get_text()
                # 버섯명(학명)
                scName = item.find('scName').get_text()
                # 이미지 원본URL
                imgFileUrl = item.find('imgFileUrl').get_text()


                results.append([scNameKr, scName, imgFileUrl])
            return results

        else:
            print('오류발생 code:', code)
            print('오류 메시지: ', resultMsg)










