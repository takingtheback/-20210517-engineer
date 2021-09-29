import requests
from bs4 import BeautifulSoup
import pandas as pd

# vo : 정류소명 조회
class StationByName:

    def __init__(self, stId=None, stNm=None, tmX=None, tmY=None, arsId=None, posX=None, posY=None):
        self.stId = stId
        self.stNm = stNm
        self.tmX = tmX
        self.tmY = tmY
        self.arsId = arsId
        self.posX = posX
        self.posY = posY


# vo : 좌표기반 근접 정류소 목록 조회
class Station_gps:

    def __init__(self, stationId=None, stationNm=None, gpsX=None, gpsY=None, arsId2=None, dist=None, posX=None, posY=None, stationTp=None):
        self.stationId=stationId
        self.stationNm=stationNm
        self.gpsX=gpsX
        self.gpsY=gpsY
        self.arsId2=arsId2
        self.dist=dist
        self.posX=posX
        self.posY=posY
        self.stationTp=stationTp

# vo : 고유번호별교통약자전용정류소목록조회 요청 정보 : arsId-정류소 고유번호
class LowStaionByUid:

    def __init__(self, stId=None, stnNm=None, arsId=None,
                 busRouteId=None, rtNm=None, firstTm=None,
                 lastTm=None, term=None, repTm1=None,
                 plainNo1=None, vehId1=None,arrmsg1=None,
                 vehId2=None, plainNo2=None, repTm2=None,
                 arrmsg2=None):
        self.stId=stId # 정류소 ID
        self.stnNm=stnNm # 정류소명
        self.arsId=arsId # 정류소 고유번호
        self.busRouteId=busRouteId # 노선ID
        self.rtNm=rtNm # 버스 번호
        self.firstTm=firstTm #첫차시간
        self.lastTm=lastTm #막차시간
        self.term=term #배차간격

        self.vehId1=vehId1 #첫번째도착예정버스ID
        self.plainNo1=plainNo1 #첫번째도착예정차량번호
        self.repTm1=repTm1 #첫번째도착예정버스의 최종 보고 시간
        self.arrmsg1=arrmsg1 #첫번째도착예정버스의 도착정보메시지

        self.vehId2=vehId2 #두번째도착예정버스ID
        self.plainNo2=plainNo2 #두번째도착예정차량번호
        self.repTm2=repTm2 #두번째도착예정버스의 현재구간 순번
        self.arrmsg2=arrmsg2 #두번째도착예정버스의 최종 정류소명


# vo : 경유노선목록 조회
class Station2:
    def __init__(self, busRouteId=None, busRouteNm=None, length=None, busRouteType=None, stBegin=None, stEnd=None,
                 term=None, nextBus=None, firstBusTm=None, lastBusTm=None, firstBusTmLow=None, lastBusTmLow=None):
        self.busRouteId = busRouteId
        self.busRouteNm = busRouteNm
        self.length = length
        self.busRouteType = busRouteType
        self.stBegin = stBegin
        self.stEnd = stEnd
        self.term = term
        self.nextBus = nextBus
        self.firstBusTm = firstBusTm
        self.lastBusTm = lastBusTm
        self.firstBusTmLow = firstBusTmLow
        self.lastBusTmLow = lastBusTmLow


# vo : 노선 기본정보 조회
class Bus:
    def __init__(self, route_id=None, bus_name=None, st_station=None, ed_station=None, term=None, first_tm=None,
                 last_tm=None, corp_name=None, length=None, routeType=None):
        self.route_id = route_id
        self.bus_name = bus_name
        self.st_station = st_station
        self.ed_station = ed_station
        self.term = term
        self.first_tm = first_tm
        self.last_tm = last_tm
        self.corp_name = corp_name
        self.length = length
        self.routeType = routeType


# 노선의 지도상 경로
class RoutePath:
    def __init__(self, no=None, gpsX=None, gpsY=None, posX=None, posY=None):
        self.no = no
        self.gpsX = gpsX
        self.gpsY = gpsY
        self.posX = posX
        self.posY = posY


# 리스트
class IDList:
    def __init__(self, id=None):
        self.id = id


# vo: 명칭 별 교통약자전용 정류소 목록조회
class Station1:
    def __init__(self, stId=None, stNm=None, tmX=None, tmY=None, arsId=None, posX=None, posY=None):
        self.stId=stId
        self.stNm=stNm
        self.tmX=tmX
        self.tmY=tmY
        self.arsId=arsId
        self.posX=posX
        self.posY=posY


# vo: 정류소 별 노선첫차/막차 예정시간 목록조회
class Station5:
    def __init__(self, arsId=None, stationNm=None, busRouteId=None, busRouteNm=None, firstBusTm=None, lastBusTm=None):
        self.arsId=arsId
        self.stationNm=stationNm
        self.busRouteId=busRouteId
        self.busRouteNm=busRouteNm
        self.firstBusTm=firstBusTm
        self.lastBusTm=lastBusTm


# vo: 고유번호 별 정류소 항목조회
class Station7:
    def __init__(self, stId=None, stNm=None, arsId=None, busRouteId=None, rtNm=None, gpsX=None, gpsY=None, stationTp=None, firstTm=None, lastTm=None, term=None, routeType=None, staOrd=None):
        self.stId = stId
        self.stNm = stNm
        self.arsId = arsId
        self.busRouteId = busRouteId
        self.rtNm = rtNm
        self.gpsX = gpsX
        self.gpsY = gpsY
        self.stationTp = stationTp
        self.firstTm = firstTm
        self.lastTm = lastTm
        self.term = term
        self.routeType = routeType
        # self.nextBus = nextBus => N : 막차아님 / Y : 막차 그런데 결과는 왜 1개 0?
        self.staOrd = staOrd


# vo : 노선별 경유 정류소 조회 :
class Station:
    def __init__(self, seq=None, arsId=None, stationNm=None, beginTm=None, lastTm=None, gpsX=None, gpsY=None,
                 direction=None):
        self.seq = seq
        self.arsId = arsId
        self.stationNm = stationNm
        self.beginTm = beginTm
        self.lastTm = lastTm
        self.gpsX = gpsX
        self.gpsY = gpsY
        self.direction = direction


# vo : 노선번호에 해당하는 노선 목록 조회 :
class BusRoute:
    def __init__(self, busRouteId=None, busRouteNm=None, length=None, stStationNm=None, edStationNm=None,
                 firstBusTm=None, lastBusTm=None, lastBusYn=None, term=None, corpNm=None, routeType=None):
        self.busRouteId = busRouteId
        self.busRouteNm = busRouteNm
        self.length = length
        self.stStationNm = stStationNm
        self.edStationNm = edStationNm
        self.firstBusTm = firstBusTm
        self.lastBusTm = lastBusTm
        self.lastBusYn = lastBusYn
        self.term = term
        self.corpNm = corpNm
        self.routeType = routeType


# 서비스 : 기능구현, 멤버변수, 메서드
class StationService:
    def __init__(self):
        self.base_url = 'http://ws.bus.go.kr/api/rest/stationinfo/'
        self.bus_url = 'http://ws.bus.go.kr/api/rest/busRouteInfo/'
        self.api_key = 'fR6oQVhtpaWn2RyCaSSreFVYmVYFcfv2W%2F03wiTFyLbtmNtjln0rmHyK4XDei92IJnjBkLpqQAc0BENj8nrhEw%3D%3D'

    # 정류장 좌표로 정류장정보 얻기
    def getStationByPosInfo(self, tmX: str, tmY: str, radius: str):
        cmd = '/getStationByPos'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&tmX=' + tmX + '&tmY=' + tmY + '&radius=' + radius
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('headerCd').get_text()
        stations = []
        if code == '0':
            items = root.select('itemList')
            for item in items:
                stationId = item.find('stationId').get_text()
                stationNm = item.find('stationNm').get_text()
                gpsX = item.find('gpsX').get_text() # 위도 x
                gpsY = item.find('gpsY').get_text() # 위도 y
                arsId2 = item.find('arsId').get_text()  # 정류소 고유번호
                dist = item.find('dist').get_text()  # 거리
                posX = item.find('posX').get_text()
                posY = item.find('posY').get_text()
                stationTp = item.find('stationTp').get_text()
                stations.append(
                    Station_gps(stationId=stationId, stationNm=stationNm, gpsX=gpsX, gpsY=gpsY, arsId2=arsId2,
                                dist=dist, posX=posX, posY=posY, stationTp=stationTp))

        else:
            print('오류발생 code:', code)

        return stations
        
    # 정류장 이름으로 정류장 정보 얻기
    def getStationByName(self, stSrch:str):
        cmd = '/getStationByName'
        url = self.base_url+cmd+'?ServiceKey='+self.api_key+'&stSrch='+stSrch
        print(url)
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('headerCd').get_text()
        if code == '0':
            item = root.select_one('itemList')
            stId = item.find('stId').get_text()
            stNm = item.find('stNm').get_text()
            tmX = item.find('tmX').get_text()
            tmY = item.find('tmY').get_text()
            arsId = item.find('arsId').get_text()
            posX = item.find('posX').get_text()
            posY = item.find('posY').get_text()
        else:
            print('오류발생 code:', code)

        return StationByName(stId=stId, stNm=stNm,tmX=tmX, tmY=tmY, arsId=arsId, posX=posX, posY=posY)

    # 정류장 버스 도착 예정 정보
    def getLowStaionByUidList(self, arsId:str):
        cmd = '/getLowStationByUid'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&arsId=' + arsId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')
        code = root.find('headerCd').get_text()
        stations = []
        if code == '0':
            items = root.select('itemList')
            for item in items:
                # 정류소 정보
                stId = item.find('stId').get_text() #정류소 id
                stnNm = item.find('stnNm').get_text() #정류소명
                arsId = item.find('arsId').get_text()

                busRouteId = item.find('busRouteId').get_text() # 노선ID
                rtNm = item.find('rtNm').get_text() # 버스 번호
                firstTm = item.find('firstTm').get_text() #첫차시간
                hour1 = firstTm[:2]
                min1 = firstTm[2:4]
                firstTm = hour1 + ':' + min1

                lastTm = item.find('lastTm').get_text() #막차시간
                hour2 = lastTm[:2]
                min2 = lastTm[2:4]
                lastTm = hour2 + ':' + min2
                term = item.find('term').get_text() #배차간격

                # 첫번째 도착 예정 버스
                vehId1 = item.find('vehId1').get_text() #첫번째도착예정버스ID
                # plainNo1 = item.find('plainNo1').get_text() #첫번째도착예정차량번호
                repTm1 = item.find('repTm1').get_text() #첫번째도착예정버스의 최종 보고 시간
                arrmsg1 = item.find('arrmsg1').get_text() #첫번째도착예정버스의 도착정보메시지

                # 두번째 도착 예정 버스
                vehId2 = item.find('vehId2').get_text() #두번째도착예정버스ID
                # plainNo2 = item.find('plainNo2').get_text() #두번째도착예정차량번호
                # repTm2 = item.find('repTm2').get_text() #두번째도착예정버스의 현재구간 순번
                arrmsg2 = item.find('arrmsg2').get_text() #두번째도착예정버스의 최종 정류소명

                stations.append(
                    LowStaionByUid(stId=stId, stnNm=stnNm, arsId=arsId, busRouteId=busRouteId, rtNm=rtNm,
                 firstTm=firstTm, lastTm=lastTm, term=term,
                 vehId1=vehId1, plainNo1=None, repTm1=repTm1,
                 arrmsg1=arrmsg1,vehId2=vehId2, plainNo2=None,
                 repTm2=None, arrmsg2=arrmsg2))

        else:
            print('오류발생 code:', code)

        return stations

    # 경유노선목록 조회
    def getRouteByStationList(self, arsId: str):
        cmd = '/getRouteByStation'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&arsId=' + arsId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')  # pip install lxml
        code = root.find('headerCd').text
        station = []
        if code == '0':
            # items = root.select('itemList')
            items = root.find_all('itemList')
            for item in items:
                busRouteId = item.find('busRouteId').get_text()
                busRouteNm = item.find('busRouteNm').get_text()
                length = item.find('length').get_text()
                busRouteType = item.find('busRouteType').get_text()
                if busRouteType == '1':
                    busRouteType = '공항'
                elif busRouteType == '2':
                    busRouteType = '마을'
                elif busRouteType == '3':
                    busRouteType = '간선'
                elif busRouteType == '4':
                    busRouteType = '지선'
                elif busRouteType == '5':
                    busRouteType = '순환'
                elif busRouteType == '6':
                    busRouteType = '광역'
                elif busRouteType == '7':
                    busRouteType = '인천'
                elif busRouteType == '8':
                    busRouteType = '경기'
                elif busRouteType == '9':
                    busRouteType = '폐지'
                elif busRouteType == '0':
                    busRouteType = '공용'
                else:
                    busRouteType = '기타'
                stBegin = item.find('stBegin').get_text()
                stEnd = item.find('stEnd').get_text()
                term = item.find('term').get_text()
                nextBus = item.find('nextBus').get_text()
                # firstBusTm = item.find('firstBusTm').get_text()
                tm = item.find('firstBusTm').get_text()
                hour = tm[8:10]
                min = tm[10:12]
                firstBusTm = hour + ':' + min

                # lastBusTm = item.find('lastBusTm').get_text() 2109280945300000
                tm = item.find('lastBusTm').get_text()
                hour = tm[8:10]
                min = tm[10:12]
                lastBusTm = hour + ':' + min

                # firstBusTmLow = item.find('firstBusTmLow').get_text()
                tm = item.find('firstBusTmLow').get_text()
                hour = tm[8:10]
                min = tm[10:12]
                firstBusTmLow = hour + ':' + min

                # lastBusTmLow = item.find('lastBusTmLow').get_text()
                tm = item.find('lastBusTmLow').get_text()
                hour = tm[8:10]
                min = tm[10:12]
                lastBusTmLow = hour + ':' + min

                station.append(
                    Station2(busRouteId=busRouteId, busRouteNm=busRouteNm, length=length, busRouteType=busRouteType,
                             stBegin=stBegin, stEnd=stEnd, term=term, nextBus=nextBus, firstBusTm=firstBusTm,
                             lastBusTm=lastBusTm, firstBusTmLow=firstBusTmLow, lastBusTmLow=lastBusTmLow))
        else:
            if code == '1':
                msg = '시스템 오류가 발생하였습니다'
            elif code == '2':
                msg = '잘못된 쿼리 요청입니다. 쿼리 변수가 정확한지 확인하세요.'
            elif code == '3':
                msg = '정류소를 찾을 수 없습니다'
            elif code == '4':
                msg = '노선을 찾을 수 없습니다.'
            elif code == '5':
                msg = '잘못된 위치로 요청을 하였습니다. 위/경도 좌표가 정확한지 확인하세요'
            elif code == '6':
                msg = '실시간 정보를 읽을 수 없습니다. 잠시 후 다시 시도하세요'
            elif code == '7':
                msg = '경로 검색 결과가 존재하지 않습니다.'
            elif code == '8':
                msg = '운행 종료되었습니다.'
            else:
                msg = '알 수 없는 오류입니다.'
            print(msg)
        return station

    # 노선 기본정보 조회
    def getRouteInfo(self, routeId: str):
        cmd = '/getRouteInfo'
        url = self.bus_url + cmd + '?ServiceKey=' + self.api_key + '&busRouteId=' + routeId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')  # pip install lxml
        code = root.find('headerCd').text
        if code == '0':
            bus_id = root.find('busRouteId').get_text()
            bus_name = root.find('busRouteNm').get_text()
            length = root.find('length').get_text()
            routeType = root.find('routeType').get_text()
            if routeType == '1':
                routeType = '공항'
            elif routeType == '2':
                routeType = '마을'
            elif routeType == '3':
                routeType = '간선'
            elif routeType == '4':
                routeType = '지선'
            elif routeType == '5':
                routeType = '순환'
            elif routeType == '6':
                routeType = '광역'
            elif routeType == '7':
                routeType = '인천'
            elif routeType == '8':
                routeType = '경기'
            elif routeType == '9':
                routeType = '폐지'
            elif routeType == '0':
                routeType = '공용'
            else:
                routeType = '기타'
            edstation = root.find('edStationNm').get_text()
            ststation = root.find('stStationNm').get_text()
            # firsttm = root.find('firstBusTm').get_text()
            tm = root.find('firstBusTm').get_text()
            hour = tm[8:10]
            min = tm[10:12]
            firsttm = hour + ':' + min

            # lasttm = root.find('lastBusTm').get_text()
            tm = root.find('lastBusTm').get_text()
            hour = tm[8:10]
            min = tm[10:12]
            lasttm = hour + ':' + min

            term = root.find('term').get_text()
            corp_name = root.find('corpNm').get_text()

            return Bus(route_id=bus_id, bus_name=bus_name, st_station=ststation, ed_station=edstation, term=term,
                       first_tm=firsttm, length=length, routeType=routeType, last_tm=lasttm, corp_name=corp_name)

        else:
            print('오류발생 code:', code)

    # 노선의 지도상 경로
    def getRoutePathList(self, busRouteId: str):
        cmd = '/getRoutePath'
        url = self.bus_url + cmd + '?ServiceKey=' + self.api_key + '&busRouteId=' + busRouteId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')  # pip install lxml
        code = root.find('headerCd').text
        stations = []
        if code == '0':
            # items = root.select('itemList')
            items = root.find_all('itemList')
            for item in items:
                no = item.find('no').get_text()
                gpsX = item.find('gpsX').get_text()
                gpsY = item.find('gpsY').get_text()
                posX = item.find('posX').get_text()
                posY = item.find('posY').get_text()
                stations.append(RoutePath(no=no, gpsX=gpsX, gpsY=gpsY, posX=posX, posY=posY))
        else:
            print('오류발생 code:', code)

        return stations

    # 노선ID 리스트
    def IDList(self):
        df = pd.read_excel('bus_station_info.xlsx', engine='openpyxl')
        data = df[['노선ID']].drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)
        id = data.values
        list = []
        for i in id:
            list.append(IDList(id=i))
        return list

    # 노선명 리스트
    def lineNameList(self):
        df = pd.read_excel('bus_station_info.xlsx', engine='openpyxl')
        data = df[['노선명']].drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)
        id = data.values
        list = []
        for i in id:
            list.append(IDList(id=i))
        return list

    # 정류소ID 리스트
    def stationIDList(self):
        df = pd.read_excel('bus_station_info.xlsx', engine='openpyxl')
        data = df[['ARS-ID']].drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)
        id = data.values
        list = []
        for i in id:
            list.append(IDList(id=i))
        return list

    # 정류소명 리스트
    def stationNameList(self):
        df = pd.read_excel('bus_station_info.xlsx', engine='openpyxl')
        data = df[['정류소명']].drop_duplicates(subset=None, keep='first', inplace=False, ignore_index=False)
        id = data.values
        list = []
        for i in id:
            list.append(IDList(id=i))
        return list

    # 명칭 별 교통약자전용 정류소 목록조회
    def getLowStationByNameList(self, stSrch:str): # 1
        cmd = '/getLowStationByName'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&stSrch=' + stSrch
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml') # pip install lxml
        code = root.find('headerCd').get_text()
        st1=[]
        if code == '0':
            items = root.find_all('itemList')
            for item in items:
                stNm = item.find('stNm').get_text()
                if stSrch == stNm:
                    stId = item.find('stId').get_text()
                    stNm = item.find('stNm').get_text()
                    tmX = item.find('tmX').get_text()
                    tmY = item.find('tmY').get_text()
                    arsId = item.find('arsId').get_text()
                    posX = item.find('posX').get_text()
                    posY = item.find('posY').get_text()
                    st1.append(Station1(stId=stId, stNm=stNm, tmX=tmX, tmY=tmY, arsId=arsId, posX=posX, posY=posY))
        else:
            print('오류발생 code:', code)

        return st1

    # 정류소 별 노선첫차/막차 예정시간 목록조회
    def getBustimeByStationList(self, arsId:str, busRouteId:str): # 5
        cmd = '/getBustimeByStation'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&arsId=' + arsId + '&busRouteId=' + busRouteId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml') # pip install lxml
        code = root.find('headerCd').get_text()
        times=[]
        if code == '0':
            items = root.find_all('itemList')
            for item in items:
                arsId = item.find('arsId').get_text()
                stationNm = item.find('stationNm').get_text()
                busRouteId = item.find('busRouteId').get_text()
                busRouteNm = item.find('busRouteNm').get_text()
                firstBusTm = item.find('firstBusTm').get_text()
                lastBusTm = item.find('lastBusTm').get_text()
                times.append(Station5(arsId=arsId, stationNm=stationNm, busRouteId=busRouteId, busRouteNm=busRouteNm, firstBusTm=firstBusTm, lastBusTm=lastBusTm))
        else:
            print('오류발생 code:', code)

        return times

    # 고유번호 별 정류소 항목조회
    def getStationByUidItem(self, arsId:str): # 7
        cmd = '/getStationByUid'
        url = self.base_url + cmd + '?ServiceKey=' + self.api_key + '&arsId=' + arsId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml') # pip install lxml
        code = root.find('headerCd').get_text()
        infos=[]
        if code == '0':
            items = root.find_all('itemList')
            for item in items:
                stId = item.find('stId').get_text()
                stNm = item.find('stNm').get_text()
                arsId = item.find('arsId').get_text()
                busRouteId = item.find('busRouteId').get_text()
                rtNm = item.find('rtNm').get_text()
                gpsX = item.find('gpsX').get_text()
                gpsY = item.find('gpsY').get_text()
                stationTp = item.find('stationTp').get_text()
                firstTm = item.find('firstTm').get_text()
                lastTm = item.find('lastTm').get_text()
                term = item.find('term').get_text()
                routeType = item.find('routeType').get_text()
                # nextBus = item.find('nextBus').get_text()
                staOrd = item.find('staOrd').get_text()
                infos.append(Station7(stId=stId, stNm=stNm, arsId=arsId, busRouteId=busRouteId, rtNm=rtNm, gpsX=gpsX, gpsY=gpsY, stationTp=stationTp, firstTm=firstTm, lastTm=lastTm, term=term, routeType=routeType, staOrd=staOrd))
        else:
            print('오류발생 code:', code)

        return infos

    # 노선별경유정류소목록조회
    def getStListByRouteId(self, routeId: str):
        cmd = '/getStaionByRoute'
        url = self.bus_url + cmd + '?ServiceKey=' + self.api_key + '&busRouteId=' + routeId
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')  # pip install lxml
        code = root.find('headerCd').get_text()
        stations = []
        if code == '0':
            items = root.find_all('itemList')
            for item in items:
                seq = item.find('seq').get_text()
                arsId = item.find('arsId').get_text()
                stationNm = item.find('stationNm').get_text()
                beginTm = item.find('beginTm').get_text()
                lastTm = item.find('lastTm').get_text()
                gpsX = item.find('gpsX').get_text()
                gpsY = item.find('gpsY').get_text()
                direction = item.find('direction').get_text()
                stations.append(
                    Station(seq=seq, arsId=arsId, stationNm=stationNm, beginTm=beginTm, lastTm=lastTm, gpsX=gpsX,
                            gpsY=gpsY, direction=direction))
        else:
            print('오류발생 code:', code)

        return stations

    # 노선번호목록조회
    def getBusRouteList(self, strSrch: str):
        cmd = '/getBusRouteList'
        url = self.bus_url + cmd + '?ServiceKey=' + self.api_key + '&strSrch=' + strSrch
        html = requests.get(url).text
        root = BeautifulSoup(html, 'lxml-xml')  # pip install lxml
        code = root.find('headerCd').get_text()
        if code == '0':
            busRouteId = root.find('busRouteId').get_text()
            busRouteNm = root.find('busRouteNm').get_text()
            length = root.find('length').get_text()
            stStationNm = root.find('stStationNm').get_text()
            edStationNm = root.find('edStationNm').get_text()
            #firstBusTm = root.find('firstBusTm').get_text()
            tm = root.find('firstBusTm').get_text()
            hour = tm[8:10]
            min = tm[10:12]
            firstBusTm = hour + ':' + min
            #lastBusTm = root.find('lastBusTm').get_text()
            tm = root.find('lastBusTm').get_text()
            hour = tm[8:10]
            min = tm[10:12]
            lastBusTm = hour + ':' + min
            lastBusYn = root.find('lastBusYn').get_text()
            term = root.find('term').get_text()
            corpNm = root.find('corpNm').get_text()
            routeType = root.find('routeType').get_text()
            if routeType == '1':
                routeType = '공항'
            elif routeType == '2':
                routeType = '마을'
            elif routeType == '3':
                routeType = '간선'
            elif routeType == '4':
                routeType = '지선'
            elif routeType == '5':
                routeType = '순환'
            elif routeType == '6':
                routeType = '광역'
            elif routeType == '7':
                routeType = '인천'
            elif routeType == '8':
                routeType = '경기'
            elif routeType == '9':
                routeType = '폐지'
            elif routeType == '0':
                routeType = '공용'

            return BusRoute(busRouteId=busRouteId, busRouteNm=busRouteNm, length=length, stStationNm=stStationNm,
                            edStationNm=edStationNm, firstBusTm=firstBusTm,
                            lastBusTm=lastBusTm, lastBusYn=lastBusYn, term=term, corpNm=corpNm, routeType=routeType)
        else:
            print('오류발생 code:', code)