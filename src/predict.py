import requests

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

for message in message_list:
    response = requests.post(
        API_ENDPOINT,
        headers={"Content-Type": "application/json"},
        json={"message": message},
    )
    print(response.json())
