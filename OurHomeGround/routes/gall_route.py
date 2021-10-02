from datetime import datetime
import os

from flask import request, render_template, redirect, Blueprint,session
from member import GalleryService, Gallery

service = GalleryService()

bp = Blueprint('gallery', __name__, url_prefix='/gallery')

@bp.route('/list')
def list():
    glist = service.getAll()
    return render_template('gallery/list.html', glist=glist)

@bp.route('/add')
def addForm():
    return render_template('gallery/form.html')

@bp.route('/add', methods=['POST'])
def upload():
    title = request.form['gall_title']
    writer = request.form['gall_writer']
    content = request.form['gall_content']
    upload_path = 'static/img/'
    f = request.files['gall_img']
    fname = upload_path+f.filename #f.filename : 업로드된 파일 명
    f.save(fname)
    fname = '/' + fname
    service.addBoard(Gallery(gall_writer=writer, gall_title=title, gall_content=content, gall_img=fname))
    return redirect('/gallery/list')


  # num = g.gall_num
  #   dir = 'static/img/' + str(num) + '/'
  #   os.mkdir(dir) # 이미지를 담을 디렉토리 생성
  #   f = []
  #   f.append(request.files['gall_img'])
  #   print(f)
  #   names= [] #업로드 파일의 새 이름
  #   for i in f:
  #       arr = f[i].filename.split('.')
  #       fileExtent = arr[len(arr)-1]
  #       fname = dir+'p_'+str(i+1)+'.'+fileExtent
  #       f[i].save(fname)
  #       names.append('/'+fname)

@bp.route('/detail/<int:gall_num>')
def detail(gall_num):
    g = service.getBoard(gall_num)
    if g.gall_writer == session['login_id']:
        flag = True
        msg = ''
    else:
        flag = False
        msg = 'readonly'
    return render_template('gallery/detail.html', g=g)


# @bp.route('/getbywriter/<string:gall_writer>')
# def detail(gall_writer):
#     glist = service.getByWriter(gall_writer)
#     return render_template('gallery/list.html', glist=glist)

# @bp.route('/getbytitle/<string:gall_title>')
# def detail(gall_title):
#     glist = service.getByTitle(gall_title)
#     return render_template('gallery/list.html', glist=glist)


@bp.route('/edit/<int:gall_num>')
def editPage(gall_num):
    g = service.getBoard(gall_num)
    return render_template('gallery/edit.html', g=g)

@bp.route('/edit', methods=['POST'])
def edit():
    num = request.form['gall_num']
    title = request.form['gall_title']
    content = request.form['gall_content']
    date = datetime.now()
    service.editBoard(Gallery(gall_num=num, gall_date=date, gall_title=title, gall_content=content))
    print("### route:", num,date,title,content)
    return render_template('gallery/list.html')
    return redirect('/gallery/list')

# @bp.route('/edit', methods=['POST'])
# def edit():
#     num = request.form['gall_num']
#     title = request.form['gall_title']
#     content = request.form['gall_content']
#     date = datetime.now()
#     # service.editBoard(Gallery(gall_num=num, gall_date=date, gall_title=title, gall_content=content))
#     service.editBoard(num, date, title, content)
#     print("### route:", num,date,title,content)
#     return redirect('/gallery/list')

@bp.route('/editDone', methods=['POST'])
def editDone(gall_num):
    g = service.getBoard(gall_num)
    return render_template('gallery/list.html', g=g)


@bp.route('/del', methods=['POST'])
def delGallery():
    # num = request.args.get('gall_num', default=0, type=int)
    # service.delBoard(num)
    # return redirect('/gallery/list')
    gall_num = request.form['gall_num']
    service.delBoard(gall_num)
    return redirect('/gallery/list')

# @bp.route('/list')
# def listPage():
#     page = request.args.get('page', type=int, default=1)
#     gallery_list = Gallery.query.order_by(Gallery.gall_num.desc())
#     gallery_list = gallery_list.paginate(page, per_page=5)
#     return render_template('gallery/list.html', gallery_list=gallery_list)