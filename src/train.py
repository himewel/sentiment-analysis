import glob

import fasttext
import pandas as pd
from sklearn.metrics import confusion_matrix


def train():
    model = fasttext.train_supervised("datasets/train.csv", epoch=10, lr=0.5)
    model.quantize(input="datasets/train.csv", retrain=True)

    index = len(glob.glob("models/*.ftz"))
    model_name = f"fasttext-{index}"
    model.save_model(f"models/{model_name}.ftz")
    return model_name


def test(model_name):
    model = fasttext.load_model(f"models/{model_name}.ftz")
    _, precision, recall = model.test("datasets/test.csv")
    score = 2 * (precision * recall) / (precision + recall)
    print(f"F1 score is: {score}")


def validate(model_name):
    model = fasttext.load_model(f"models/{model_name}.ftz")
    df = pd.read_csv("datasets/valida.csv")
    df["predicted"] = df["text"].apply(lambda x: model.predict(x)[0][0])
    print(confusion_matrix(df["label"], df["predicted"]))


if __name__ == "__main__":
    model_name = train()
    test(model_name)
    validate(model_name)
