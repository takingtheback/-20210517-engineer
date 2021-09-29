from flask import Flask, request, render_template, redirect, Blueprint
import models as mo
import matplotlib.pyplot as plt

# 블루 프린트 등록, 요청 url을 등록하는
# 라우트를 저장해두는 보관해두는 객체, 라우트를 임시로 저장하는 저장소
bp = Blueprint('station', __name__, url_prefix='/station')

# 정류장과 관련된 기능을 제공해주는 서비스 객체
service_sj = mo.StationService()

# 정류소 정보 이름으로 검색해서 조회
@bp.route('/station-name-gps', methods=['POST'])
def station_name_gps():
    stSrch = request.form['stSrch']
    stationByName: mo.StationByName = service_sj.getStationByName(stSrch)
    tmX = str(stationByName.tmX)
    tmY = str(stationByName.tmY)
    radius = str(50) # 반경
    arsId = str(stationByName.arsId)
    station_gps: mo.Station_gps = service_sj.getStationByPosInfo(tmX, tmY, radius)
    lowStaionByUid: mo.LowStaionByUid = service_sj.getLowStaionByUidList(arsId)
    # bus=bus, 뷰페이지에 전달할 값
    return render_template('station/stationGpsByName.html', stationByName=stationByName, station_gps=station_gps, lowStaionByUid=lowStaionByUid)

# 교통약자 정류소 정보 조회
@bp.route('/lowStaionByUid', methods=['POST'])
def lowStaionByUid():
    arsId = request.form['arsId']
    lowStaionByUid: mo.LowStaionByUid = service_sj.getLowStaionByUidList(arsId)
    stSrch = lowStaionByUid[0].stnNm
    stationByName: mo.StationByName = service_sj.getStationByName(stSrch)
    tmX = str(stationByName.tmX)
    tmY = str(stationByName.tmY)
    radius = str(50)  # 반경
    station_gps: mo.Station_gps = service_sj.getStationByPosInfo(tmX, tmY, radius)

    # 뷰페이지에 전달할 값
    return render_template('station/LowStaionByUidList.html', lowStaionByUid=lowStaionByUid, station_gps=station_gps)


# 경유노선목록 조회
@bp.route('/route-stationList', methods=['POST'])
def route_stationList():
    arsId = request.form['arsId']
    stList:list= service_sj.getRouteByStationList(arsId=arsId)
    return render_template('bus/routeList.html', stList=stList, arsId=arsId)


# 노선 기본정보 조회
@bp.route('/route-info', methods=['POST'])
def route_info():
    routeid = request.form['routeid']
    bus: mo.Bus = service_sj.getRouteInfo(routeId=routeid)
    return render_template('bus/businfo.html', bus=bus)


# 노선의 지도상 경로
@bp.route('/route-pathList', methods=['POST'])
def route_pathList():
    busRouteId = request.form['busRouteId']
    stList:list = service_sj.getRoutePathList(busRouteId=busRouteId)
    return render_template('bus/pathList.html', stList=stList, busRouteId=busRouteId)


# 노선ID 리스트
@bp.route('/IDList')
def IDList():
    stList:list = service_sj.IDList()
    return render_template('bus/IDList.html', stList=stList)


# 노선명 리스트
@bp.route('/lineNameList')
def lineNameList():
    stList:list = service_sj.lineNameList()
    return render_template('bus/lineNameList.html', stList=stList)


# 정류소ID 리스트
@bp.route('/stationIDList')
def stationIDList():
    stList:list = service_sj.stationIDList()
    return render_template('bus/stationIDList.html', stList=stList)


# 정류소명 리스트
@bp.route('/stationNameList')
def stationNameList():
    stList:list = service_sj.stationNameList()
    return render_template('bus/stationNameList.html', stList=stList)


# 명칭 별 교통약자전용 정류소 목록조회
@bp.route('/route-ls', methods=['POST'])
def route_ls():
    stSrch = request.form['stSrch']
    st1:list = service_sj.getLowStationByNameList(stSrch=stSrch)
    return render_template('bus/one.html', st1=st1, stSrch=stSrch)


# 정류소 별 노선첫차/막차 예정시간 목록조회
@bp.route('/route-time', methods=['POST'])
def route_time():
    arsId = request.form['arsId']
    busRouteId = request.form['busRouteId']
    times:list = service_sj.getBustimeByStationList(arsId=arsId, busRouteId=busRouteId)
    return render_template('bus/five.html', times=times, arsId=arsId, busRouteId=busRouteId)


# 고유번호 별 정류소 항목조회
@bp.route('/route-infos', methods=['POST'])
def route_infos():
    arsId = request.form['arsId']
    infos:list = service_sj.getStationByUidItem(arsId=arsId)
    return render_template('bus/seven.html', infos=infos, arsId=arsId)


# 노선별경유정류소목록조회
@bp.route('/route-path', methods=['POST'])
def route_path():
    routeid = request.form['routeid']
    stList:list = service_sj.getStListByRouteId(routeId=routeid)
    return render_template('bus/stList.html', stList=stList, routeid=routeid)


# 노선번호목록조회
@bp.route('/route-list', methods=['POST'])
def route_list():
    strSrch = request.form['strSrch']
    bus: mo.BusRoute = service_sj.getBusRouteList(strSrch=strSrch)
    return render_template('bus/busRouteList.html', bus=bus)


# 페이지 이동
# 교통약자전용 정류소
@bp.route('/lowStation')
def lowStation():
    return render_template('page/lowStationSearch.html')

# 일반정류소
@bp.route('/normalStation')
def normalStation():
    return render_template('page/stationSearch.html')

# 노선 정보
@bp.route('/routeInfo')
def routeInfo():
    return render_template('page/routeSearch.html')

# 경유 정보
@bp.route('/stopOverInfo')
def stopOverInfo():
    return render_template('page/stopOverSearch.html')

# 팝업창 새로고침
@bp.route('/renewal')
def renewal():
    return render_template('page/stationGpsByName.html')
