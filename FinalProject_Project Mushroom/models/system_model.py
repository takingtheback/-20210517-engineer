import requests
from bs4 import BeautifulSoup


class System:
    def __init__(self, systemkorname=None, systemname=None, systemid=None):
        # 분류군국명
        self.systemkorname = systemkorname
        # 분류군명
        self.systemname = systemname
        # 분류군ID
        self.systemid = systemid

class Service:
    def __init__(self):
        self.base_url = 'http://apis.data.go.kr/1400119/KffniService1'
        self.api_key = ''

    # 분류군정보 목록 검색
    def searchRequest(self, st, sw, numOfRows, pageNo):
        url = self.base_url + '/systemSearch?ServiceKey=' + self.api_key + '&st='+ st + '&sw=' + sw + '&numOfRows=' + numOfRows + '&pageNo=' + pageNo
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('resultCode').text
        resultMsg = root.find('resultMsg').text
        results = []

        if code == '00':
            items = root.select('item')
            for item in items:
                # 분류군국명
                systemkorname = item.find('systemkorname').text
                # 분류군명
                systemname = item.find('systemname').text
                # 분류군ID
                systemid = item.find('systemid').text

                results.append([systemkorname, systemname, systemid])

            return results

        else:
            print('오류발생코드: ', code)
            print('오류 메시지: ', resultMsg)

    # 분류군정보 상세정보 조회
    def infoRequest(self, q1):
        url = self.base_url + '/systemInfo?ServiceKey=' + self.api_key + '&q1='+ q1
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('resultCode').text
        resultMsg = root.find('resultMsg').text
        results = []

        if code == '00':
            items = root.select('item')
            for item in items:
                # 분류군국명
                systemkorname = item.find('systemkorname').text
                # 분류군명
                systemname = item.find('systemname').text
                # 분류군ID
                systemid = item.find('systemid').text
                # 상위분류군ID
                uppersystemid = item.find('uppersystemid').text
                # 저작권설명
                cprtCtnt = item.find('cprtCtnt').text

                results.append([systemkorname, systemname, systemid, uppersystemid, cprtCtnt])

            return results

        else:
            print('오류발생코드: ', code)
            print('오류 메시지: ', resultMsg)
