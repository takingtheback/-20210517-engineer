from datetime import datetime
import sys

from flask import session
from flask_migrate import Migrate
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
migrate = Migrate()


# 멤버(회원관리)
class Member(db.Model):
    id = db.Column(db.String(30), primary_key=True)
    pwd = db.Column(db.String(30), nullable=False)
    name = db.Column(db.String(30), nullable=False)
    email = db.Column(db.String(40), nullable=False)
    mobile = db.Column(db.String(20), nullable=False)

#갤러리
class Gallery(db.Model):
    gall_num = db.Column(db.Integer, primary_key=True)
    gall_writer = db.Column(db.String(30), db.ForeignKey('member.id', ondelete='CASCADE'))
    gall_date = db.Column(db.Date(), nullable=False)
    gall_title = db.Column(db.String(100), nullable=False)
    gall_content = db.Column(db.String(1500), nullable=False)
    gall_img = db.Column(db.String(500), nullable=False)

#게시판
class Board(db.Model):
    num = db.Column(db.Integer, primary_key=True)
    writer = db.Column(db.String(20), db.ForeignKey('member.id', ondelete='CASCADE'))
    #역참조.
    member = db.relationship('Member', backref=db.backref('board_set'))
    w_date = db.Column(db.DateTime(), nullable=False)
    title = db.Column(db.String(50), nullable=False)
    content = db.Column(db.String(200), nullable=False)

#댓글
class Response(db.Model):
    resnum = db.Column(db.String(20), primary_key=True)
    write = db.Column(db.String(200), nullable=False)


class MemService:
    def join(self, m: Member):  # 회원가입
        db.session.add(m)
        db.session.commit()

    def login(self, id: str, pwd: str):  # 로그인
        mem = Member.query.get(id)
        if mem is not None:
            if pwd == mem.pwd:
                session['login_id'] = id
                session['flag'] = True
                return True

        return False

    def myInfo(self):  # 로그인한 id로 검색한 객체 반환
        id = session['login_id']
        return Member.query.get(id)

    def editMyInfo(self, name: str, pwd: str, email: str, mobile: str):  # 새 pwd 받아서 현재 로그인 중인 id로 검색하여 수정
        mem = self.myInfo()
        mem.name = name
        mem.pwd = pwd
        mem.email = email
        mem.mobile = mobile
        db.session.commit()

    def logout(self):  # session에서 id 삭제 및 flag = False로 변환
        session.pop('login_id')
        session['flag'] = False

    def out(self):  # 로그인한 id를 db에서 삭제. 로그아웃 처리.
        mem = self.myInfo()
        db.session.delete(mem)
        db.session.commit()
        self.logout()

    def findId(self, name: str, email: str):   # name, email 값 입력 후 아이디 반환
        # print('service', Member.query.filter(Member.email == email).all())    # <Member user01> 로 출력됨
        # return Member.query.filter(Member.email == email).all()
        user = Member.query.filter((Member.name == name)&(Member.email == email)).first()
        return user.id if hasattr(user, 'id') else None

    def checkCode(self, id: str, email: str):   # id, email값 입력 후 email 반환
        user = Member.query.filter((Member.id == id)&(Member.email == email)).first()
        return user.id if hasattr(user, 'id') else None

    def resetPwd(self, id: str, pwd: str):  # 새 pwd 받아서 현재 로그인 중인 id로 검색하여 수정
        mem = Member.query.get(id)
        mem.pwd = pwd
        db.session.commit()

    def KakaoLogin(self, id: str):  # 카카오로그인 성공한 경우 session 값 입력
        session['login_id'] = id
        print('service', session['login_id'])
        session['flag'] = True
        return True

#갤러리
class GalleryService:
    def addBoard(self, g:Gallery):
        g.gall_date = datetime.now()
        db.session.add(g)
        db.session.commit()

    def getBoard(self, gall_num:int):
        return Gallery.query.get(gall_num)

    def getAll(self):
        return Gallery.query.order_by(Gallery.gall_num.desc())

    # def getByTitle(self, gall_title):
    #     return Gallery.query.filter(Gallery.gall_title.like('%'+gall_title+'%')).all()

    # def getByWriter(self, gall_writer):
    #     gall = Member.query.get(gall_writer)
    #     if gall is not None:
    #         return gall.gall_set

    def editBoard(self, g:Gallery):
        print("###", g.gall_num)
        g2 = Gallery.query.get(g.gall_num)
        print("###", g2)
        g2.date = g.gall_date
        g2.title = g.gall_title
        g2.content = g.gall_content
        db.session.commit()

    # def editBoard(self, gall_num:int, num:int, date:datetime, title:str, content:str):
    #     g2 = self.getBoard(gall_num)
    #     print('##:', gall_num, num, date, title, content)
    #     # g2.date = g.gall_date
    #     # g2.title = g.gall_title
    #     # g2.content = g.gall_content
    #     g2.num = num
    #     g2.date = date
    #     g2.title = title
    #     g2.content = content
    #     print('##:', g2.num, g2.date, g2.title, g2.content)
    #     db.session.commit()

    # def delBoard(self, gall_num:int):
    #     g = self.getBoard(gall_num)
    #     db.session.delete(g)
    #     db.session.commit()

    def delBoard(self, gall_num:int):
        g = self.getBoard(gall_num)
        db.session.delete(g)
        db.session.commit()
 
#게시판       
class BoardService:
    def addBoard(self, b:Board):#작성자id, title, content
        b.w_date = datetime.now()
        db.session.add(b)
        db.session.commit()

    def getBoard(self, num):
        return Board.query.get(num)

    def getAll(self):
        return Board.query.order_by(Board.num.desc())

    def getByTitle(self, tit):
        return Board.query.filter(Board.title.like('%'+tit+'%')).all()

    def getByNum(self, num:int):
        return Board.query.get(num)

    def getByWriter(self, writer):
        mem = Member.query.get(writer)
        if mem is not None:
            return mem.board_set #작성자가 쓴 모든 글 검색해서 반환

    def editBoard(self, b:Board):
        b2 = Board.query.get(b.num)
        b2.writer = b.writer
        b2.title = b.title
        b2.content = b.content
        db.session.commit()

    def delBoard(self, num:int):
        b = Board.query.get(num)
        db.session.delete(b)
        db.session.commit()
        
#댓글
class ResponseService():
    def addResponse(self, r:Response):  # 작성자id, title, content
        db.session.add(r)
        db.session.commit()

    def getAllResponse(self):
        return Response.query.get()
