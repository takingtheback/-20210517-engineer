import os

from flask import *
from MushroomClassification.models import imgClassifier_model as imgClassifier

imgClassifierService = imgClassifier.imgClassifierService()

mushroom_bp = Blueprint("mushroom", __name__, url_prefix="/mushroom")

@mushroom_bp.route("/imgClassifier")
def imgClassifierInput():
    listdir = os.listdir("static/uploads/imgClassifier/")

    for i in range(len(listdir)):
        if listdir[i] != ".DS_Store":
            os.remove("static/uploads/imgClassifier/"+listdir[i])
        else:
            continue

    return render_template("imgClassifier/imgClassifier_input.html")

@mushroom_bp.route("/imageSearch", methods=["POST"])
def imgClassifierInputAction():
    inputImage = request.files["uploadfile"]
    inputImage.save("static/uploads/imgClassifier/"+(inputImage.filename))

    res = imgClassifierService.getResult(inputImage)

    list = imgClassifierService.searchMushInfo(res)
    return render_template("imgClassifier/imgClassifier_output.html", img=inputImage.filename, res=res, list=list)