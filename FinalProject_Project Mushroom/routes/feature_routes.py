from flask import request, render_template, Blueprint
from MushroomClassification_1101.models import feature_model

fe_bp = Blueprint('feature', __name__, url_prefix='/feature')
fe_service = feature_model.FeatureService()
feature = feature_model.Feature

# 입력 폼
@fe_bp.route('/featureForm')
def Form():
    cap_shape = None
    cap_surface = None
    cap_color = None
    bruises = None
    odor = None
    gill_color = None
    population = None
    return render_template('featureForm.html', cap_shape=cap_shape, cap_surface=cap_surface, cap_color=cap_color,bruises=bruises,odor=odor, gill_color=gill_color,population=population)

# 독버섯 여부 판별
@fe_bp.route('/search', methods=['POST'])
def search():
    cap_shape = int(request.form['cap_shape'])
    cap_surface = int(request.form['cap_surface'])
    cap_color = int(request.form['cap_color'])
    bruises = int(request.form['bruises'])
    odor = int(request.form['odor'])
    gill_color = int(request.form['gill_color'])
    population = int(request.form['population'])
    f = [cap_shape, cap_surface, cap_color, bruises, odor, gill_color, population]
    res = fe_service.getResult(f)
    if res == 1:
        res = '독버섯'
    else:
        res = '독버섯 아님'
    cap_shapeList = ['bell', 'conical', 'flat', 'knobbed', 'sunken', 'convex']
    cap_surfaceList = ['fibrous', 'grooves', 'smooth', 'scaly']
    cap_colorList = ['buff', 'cinnamon', 'red', 'gray', 'pink', 'green', 'purple', 'white', 'yellow']
    bruisesList = ['없음', '있음']
    odorList = ['almond', 'creosote', 'foul', 'anise', 'musty', 'none', 'pungent', 'spicy', 'fishy']
    gill_colorList = ['buff', 'red', 'gray', 'chocolate', 'black', 'brown', 'orange', 'pink', 'green', 'purple', 'white','yellow']
    populationList = ['abundant', 'clustered', 'numerous', 'scattered', 'several', 'solitary']

    cap_shape = cap_shapeList[cap_shape]
    cap_surface = cap_surfaceList[cap_surface-6]
    cap_color = cap_colorList[cap_color-10]
    bruises = bruisesList[bruises-20]
    odor = odorList[odor-22]
    gill_color = gill_colorList[gill_color-31]
    population = populationList[population-43]


    return render_template('featureResult.html', res=res, cap_shape=cap_shape, cap_surface=cap_surface, cap_color=cap_color,bruises=bruises,odor=odor, gill_color=gill_color,population=population)