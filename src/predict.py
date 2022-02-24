import requests
import pandas as pd

API_ENDPOINT = "http://localhost:5000/predict"

message_list = [
    "This purchase was my worst mistake",
    "This ruined my life",
    "The smell is the worst part",
    "It is too difficult",
    "Would recommend if it wasn't so overpriced",
    "Such a great experience",
    "Everyone should watch this",
    "I love to watch this movie again and again",
    "This could not have helped more",
    "My mom  enjoys listening to it",
]

predicted_list = []
probability_list = []
for message in message_list:
    response = requests.post(
        API_ENDPOINT,
        headers={"Content-Type": "application/json"},
        json={"message": message},
    )
    predicted_list.append(response.json()["predicted"])
    probability_list.append(response.json()["probability"])

data = zip(message_list, predicted_list, probability_list)
df = pd.DataFrame(data, columns=["message", "label", "probability"])
print(df)
