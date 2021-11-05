from flask import request, render_template, Blueprint
from MushroomClassification.models import img_model

is_bp = Blueprint('img', __name__, url_prefix='/img')
is_service = img_model.Service()

# 입력
@is_bp.route('/imgForm')
def imgForm():
    return render_template('imgForm.html')

# 이미지 포함 검색
@is_bp.route('/imgSearchResult', methods=['POST'])
def imgSearchResult():
    # 페이지 인덱스
    pageIndex = request.form['pageIndex']

    # 검색어
    searchWord = request.form['searchWord']
    List = is_service.imgSearch(pageIndex, searchWord)
    return render_template('imgSearchResult.html', List=List, searchWord=searchWord)


