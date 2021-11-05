from flask import request, render_template, Blueprint
from MushroomClassification.models import system_model

sy_bp = Blueprint('system', __name__, url_prefix='/system')
sy_service = system_model.Service()


# 입력 폼
@sy_bp.route('/searchFormKor')
def searchFormKor():
    return render_template('systemFormKor.html')

# 입력 폼
@sy_bp.route('/searchFormEng')
def searchFormEng():
    return render_template('systemFormEng.html')

# 한글 분류명 검색
@sy_bp.route('/searchKor', methods=['POST'])
def searchKor():
    # 분류군 한글)
    st = request.form['st']
    # 검색어
    sw = request.form['sw']
    # 한 페이지 결과 수
    numOfRows = request.form['numOfRows']
    # 페이지 번호
    pageNo = request.form['pageNo']

    List = sy_service.searchRequest(st, sw, numOfRows, pageNo)
    return render_template('systemRequest.html', List=List)

# 영문 분류명 검색
@sy_bp.route('/searchEng', methods=['POST'])
def searchEng():
    # 분류군 영어)
    st = request.form['st']
    # 검색어
    sw = request.form['sw']
    # 한 페이지 결과 수
    numOfRows = request.form['numOfRows']
    # 페이지 번호
    pageNo = request.form['pageNo']

    List = sy_service.searchRequest(st, sw, numOfRows, pageNo)
    return render_template('systemRequest.html', List=List)

# 분류군정보 상세정보 조회
@sy_bp.route('/systemInfoRequest', methods=['POST'])
def infoRequest():
    # 분류군
    q1 = request.form['q1']
    List = sy_service.infoRequest(q1)
    return render_template('systemInfoRequest.html', List=List)