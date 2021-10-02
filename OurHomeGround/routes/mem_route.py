import sys

from flask import request, render_template, Blueprint
from member import MemService, Member

service = MemService()

bp = Blueprint('member', __name__, url_prefix='/member')


@bp.route('/join')
def joinForm():
    return render_template('member/form.html')


@bp.route('/join', methods=['POST'])
def join():
    id = request.form['id']
    pwd = request.form['pwd']
    name = request.form['name']
    email = request.form['email']
    mobile = request.form['mobile']
    service.join(Member(id=id, pwd=pwd, name=name, email=email, mobile=mobile))
    return render_template('member/formResult.html')


@bp.route('/loginForm')
def loginForm2():
    return render_template('member/loginForm.html')


@bp.route('/login')
def loginForm():
    return render_template('member/login.html')


@bp.route('/login', methods=['POST'])
def login():
    id = request.form['id']
    pwd = request.form['pwd']
    flag = service.login(id, pwd)
    if flag:
        return render_template('map/health.html')
    else:
        return render_template('member/error.html')


@bp.route('/myinfo')
def myinfo():
    m = service.myInfo()
    return render_template('member/detail.html', m=m)


@bp.route('/out')
def out():
    service.out()
    return render_template('map/health.html')


@bp.route('/logout')
def logout():
    service.logout()
    return render_template('map/health.html')


@bp.route('/edit', methods=['POST'])
def edit():
    name = request.form['name']
    pwd = request.form['pwd']
    email = request.form['email']
    mobile = request.form['mobile']
    service.editMyInfo(name, pwd, email, mobile)
    return render_template('map/health.html')


@bp.route('/findIdForm')
def findIdForm():
    return render_template('member/findId.html')


@bp.route('/findId', methods=['POST'])
def findId():
    name = request.form['name']
    email = request.form['email']
    m = service.findId(name, email)
    if m is not None:
        return render_template('member/idResult.html', m=m)
    else:
        return render_template('member/error.html')


@bp.route('/findPwd')
def findPwdForm():
    return render_template('member/findPwd.html')


@bp.route('/checkCode', methods=['POST'])
def checkCode():
    tempNum = request.form['tempNum']
    id = request.form['id']
    email = request.form['email']

    m = service.checkCode(id, email)
    if m is not None:
        return render_template('member/checkCode.html', m=m, tempNum=tempNum)
    else:
        return render_template('member/error.html')


@bp.route('/resetPwdForm', methods=['POST'])
def resetPwdForm():
    id = request.form['id']
    tempNum = request.form['tempNum']
    tempNumConfirm = request.form['tempNumConfirm']
    if (tempNum == tempNumConfirm):
        return render_template('member/resetPwd.html', id=id)
    else:
        return render_template('member/error.html')


@bp.route('/resetPwd', methods=['POST'])
def resetPwd():
    id = request.form['id']
    pwd = request.form['pwd']
    service.resetPwd(id, pwd)
    return render_template('member/pwdResult.html')


@bp.route('/kakaoLogin', methods=['POST'])
def kakaoLogin():
    id = request.form['kid']
    print('route id', id)
    flag = service.KakaoLogin(id)
    if flag:
        return render_template('map/health.html')