import requests
from flask import request, render_template, Blueprint

bp = Blueprint('map', __name__, url_prefix='/map')

@bp.route('/search')
def search():
    return render_template('map/address.html')

@bp.route('/address')
def address():
    return render_template('map/maphome.html')

@bp.route('/health')
def health():
    return render_template('map/health.html')

@bp.route('/hospital')
def hospital():
    return render_template('map/hospital.html')

@bp.route('/medicine')
def medicine():
    return render_template('map/medicine.html')

@bp.route('/pet')
def pet():
    return render_template('map/pet.html')

@bp.route('/box')
def box():
    return render_template('map/box.html')

@bp.route('/keyword')
def keyword():
    return render_template('map/keyword.html')

#data = (requests.get('https://api.odcloud.kr/api/15005433/v1/uddi:d6bf182d-89cc-4ed0-a511-87d5aef074ec_202004131710?page=1&perPage=700&serviceKey=%2BegeY%2BrZhlv1oztvHuBXhHmLJQ3g4lPE5AMRfBkvvqpOxy0KHdoFDINZNMLGdsmoYZmV4hbRZIc5iWmU3fJMsw%3D%3D').json())
#print(data['data'][0]['상호'])