from flask import Flask, render_template
from templates.routes import routes as r
from apscheduler.schedulers.background import BackgroundScheduler

#플라스크 객체를 생성, __name__모듈에 현재 프로젝트 디렉토리가 들어감.
app = Flask(__name__)

#블루 프린트 등록
app.register_blueprint(r.bp)

#사용자의 요청url을 처리하는 페이지
@app.route('/')
def root():
    return render_template('index.html')

if __name__ == '__main__':
    app.run(port=5000)
    #flask 서버, 객체 실행해주는 함수
    #port번호 설정이 가능하다.

#static 디렉토리는 정적인 거 넣는 폴더
