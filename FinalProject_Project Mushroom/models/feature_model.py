import joblib
import numpy as np


class Feature:
    def __init__(self, cap_shape, cap_surface, cap_color, bruises, odor, gill_color, population):
        self.cap_shape = cap_shape
        self.cap_surface = cap_surface
        self.cap_color = cap_color
        self.bruises = bruises
        self.odor = odor
        self.gill_color = gill_color
        self.population = population

class FeatureService:
    # 머신러닝으로 학습된 모델을 통해 독버섯 여부 판별 결과 가져오는 메서드
    def getResult(self, feature):
        model = joblib.load('mushroom_stand_out_model.pkl')  # 사용할 모델 파일 로드
        arr = np.zeros(49, dtype=int)
        for f in feature:
            arr[f] = 1
        res = model.predict([arr])
        return res