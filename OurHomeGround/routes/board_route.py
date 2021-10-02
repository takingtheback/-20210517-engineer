import sys
from flask import request, render_template, redirect, Blueprint
from member import Board, BoardService

service = BoardService()

bp = Blueprint('board', __name__, url_prefix='/board')

@bp.route('/list')
def list():
    blist = service.getAll()
    return render_template('board/list.html', blist=blist)

@bp.route('/add')
def addForm():
    return render_template('board/form.html')

@bp.route('/get')
def getContent():
    num = request.args.get('num', 0, int)
    b = service.getByNum(num)
    return render_template('board/content.html', b=b)

@bp.route('/add', methods=['POST'])
def add():
    writer = request.form['writer']
    title = request.form['title']
    content = request.form['content']
    service.addBoard(Board(writer=writer, title=title, content=content))
    return redirect('/board/list')

@bp.route('/edit', methods=['POST'])
def edit():
    num = int(request.form['num'])
    writer = request.form['writer']
    title = request.form['title']
    content = request.form['content']
    service.editBoard(Board(num=num, writer=writer, title=title, content=content))
    return redirect('/board/list')

@bp.route('/del')
def prod_del():
    num = request.args.get('num', 0, int)
    service.delBoard(num)
    return redirect('/board/list')