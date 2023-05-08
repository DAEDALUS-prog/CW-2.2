import requests
import json
import random
import os

def get_short_joke():
    url = "https://api.spoonacular.com/food/jokes/random"
    params = {
        "apiKey": "c9ec5e68c1e841a59ae29be71d052a47"
    }

    response = requests.get(url, params=params)

    if response.ok:
        joke = response.json()["text"]
        if len(joke) > 30:
            get_json_joke()
        else:
            print(joke)
            return
    else:
        print("Не удалось получить шутку: ", response.status_code)
        return
    


def get_json_joke():
    jokes_path = os.path.join(os.path.dirname(__file__), 'jokes.json')
    with open(jokes_path) as f:
        jokes_data = json.load(f)
    jokes = jokes_data['jokes']
    random_joke = random.choice(jokes)
    return random_joke


