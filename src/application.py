import os

from flask import Flask, request, make_response, render_template
import fasttext

app = Flask(__name__)
model = fasttext.load_model("models/fasttext-3.ftz")


@app.route("/predict", methods=["POST"])
def predict():
    try:
        request_dict = request.form if request.form else request.get_json()

        prediction = model.predict(request_dict["message"])
        res = {"predicted": prediction[0][0], "probability": prediction[1][0]}

        return make_response(res, 200)

    except Exception as e:
        return make_response(str(e), 500)


if __name__ == "__main__":
    app.run(host="0.0.0.0")
