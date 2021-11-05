import random
from flask import request, render_template, Blueprint
from MushroomClassification.models import resource_model

re_bp = Blueprint('resource', __name__, url_prefix='/resource')
re_service = resource_model.Service()


# 입력 폼
@re_bp.route('/resourceForm')
def resourceForm():
    return render_template('resourceForm.html')


# 영문 입력 폼
@re_bp.route('/resourceEngForm')
def resourceEngForm():
    return render_template('resourceEngForm.html')


# 버섯도감 목록 검색
@re_bp.route('/searchRequest', methods=['POST'])
def searchRequest():
    # 검색어 구분 (1 : 국명, 2 : 학명, 3 : 국명일치, 4 : 학명일치)
    st = request.form['st']
    # 검색어
    sw = request.form['sw']
    # 한 페이지 결과 수
    numOfRows = request.form['numOfRows']
    # 페이지 번호
    pageNo = request.form['pageNo']
    List = re_service.searchRequest(st, sw, numOfRows, pageNo)
    return render_template('searchRequest.html', List=List, sw=sw)


# 버섯도감 목록 영문 검색
@re_bp.route('/searchEngRequest', methods=['POST'])
def searchEngRequest():
    # 검색어 구분 (1 : 국명, 2 : 학명, 3 : 국명일치, 4 : 학명일치)
    st = request.form['st']
    # 검색어
    sw = request.form['sw']
    # 한 페이지 결과 수
    numOfRows = request.form['numOfRows']
    # 페이지 번호
    pageNo = request.form['pageNo']
    List = re_service.searchRequest(st, sw, numOfRows, pageNo)
    return render_template('searchEngRequest.html', List=List, sw=sw)


# 버섯도감 상세정보 조회
@re_bp.route('/infoRequest', methods=['POST'])
def infoRequest():
    # 도감번호
    q1 = request.form['q1']
    List = re_service.infoRequest(q1)
    return render_template('infoRequest.html', List=List)


# 식용/독버섯 이미지 테스트
@re_bp.route('/testSurviveOrDeath')
def testSurviveOrDeath():
    x = random.randrange(1, 6)
    url = "/imgQuestion/question" + str(x) + ".html"
    return render_template(url)
    # return render_template('/imgQuestion/question4.html')


# 독버섯 정보 - 독버섯 구별법
@re_bp.route('/poisonousMushroom')
def poisonousMushroom():
    return render_template('/imgQuestion/poisonousMushroom1.html')


# 독버섯 정보 - 독버섯 분포현황
@re_bp.route('/poisonousMushroom2')
def poisonousMushroom2():
    return render_template('/imgQuestion/poisonousMushroom2.html')


# 독버섯 정보 - 중독사고 발생 현황
@re_bp.route('/poisonousMushroom3')
def poisonousMushroom3():
    return render_template('/imgQuestion/poisonousMushroom3.html')


# 식용/독버섯 이미지 테스트: 오답페이지
@re_bp.route('/wrongAnswer', methods=['POST'])
def wrongAnswer():
    name = request.form['name']
    msg = re_service.advice()
    return render_template('/imgQuestion/wrongAnswer.html', msg=msg, name=name)


# 식용/독버섯 이미지 테스트: 정답페이지
@re_bp.route('/correctAnswer', methods=['POST'])
def correctAnswer():
    name = request.form['name2']
    return render_template('/imgQuestion/correctAnswer.html', name=name)


# 식용버섯 요리 리스트
@re_bp.route('/mushroomDish')
def mushroomDish(pageNo='1'):
    List = re_service.mushroomDish(pageNo)
    return render_template('/dish/mushroomDish.html', List=List)


# 식용버섯 요리 리스트 페이징
@re_bp.route('/mushroomDishNo', methods=['POST'])
def mushroomDishNo():
    pageNo = request.form['pageNo']
    List = re_service.mushroomDish(pageNo)
    return render_template('/dish/mushroomDish.html', List=List)