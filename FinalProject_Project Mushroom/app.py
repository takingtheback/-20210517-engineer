import torch
import torch.nn as nn
import torch.nn.functional as F

from flask import Flask, render_template
from routes import resource_routes as r
from routes import img_routes as ir
from routes import system_routes as s
from routes import feature_routes as fe
from routes import imgClassifier_routes

# 플라스크 객체 생성
app = Flask(__name__)

# 블루프린트 객체 등록
app.register_blueprint(r.re_bp)
app.register_blueprint(ir.is_bp)
app.register_blueprint(s.sy_bp)
app.register_blueprint(fe.fe_bp)
app.register_blueprint(imgClassifier_routes.mushroom_bp)

class Net(nn.Module):
    def __init__(self):
        super().__init__()
        self.conv1 = nn.Conv2d(3, 6, 5) # kernel=5, paddig=0. stride=1. 32-5+1=28
        self.pool = nn.MaxPool2d(2, 2)  # 14
        self.conv2 = nn.Conv2d(6, 16, 5) # kernel=5, paddig=0. stride=1. 14-5+1=10 => max pooling 후 5X5
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 20)
        self.fc3 = nn.Linear(20, 9)

    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = torch.flatten(x, 1) # 배치를 제외한 모든 차원을 평탄화(flatten)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x

@app.route('/')
def root():
    return render_template('resourceForm.html')

if __name__ == '__main__':
    app.run()


