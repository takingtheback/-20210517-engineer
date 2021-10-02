from flask import request, render_template, redirect, Blueprint
from member import Response, ResponseService

service = ResponseService()

bp = Blueprint('response', __name__, url_prefix='/response')

@bp.route('/add')
def addFormResponse():
    return render_template('response/form.html')

@bp.route('/get')
def getResponse():
    r = service.getAllResponse()
    return render_template('response/viewResponse.html', r=r)

@bp.route('/add', methods=['POST'])
def addResponse():
    resnum = request.form['resnum']
    write = request.form['write']
    service.addResponse(Response(resnum=resnum, write=write))
    return redirect('/board/list')
