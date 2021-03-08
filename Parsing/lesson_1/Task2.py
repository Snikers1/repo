""" Изучить список открытых API. Найти среди них любое, требующее авторизацию (любого типа).
    Выполнить запросы к нему, пройдя авторизацию. Ответ сервера записать в файл."""
import requests
import json
from pprint import pprint

apikey = "894UK5XO0CX1"
search_term = "excited"
limit = 10

concrete_params = {"q": search_term, "key": apikey, "limit": limit}

# get the top 8 GIFs for the search term
try:
    request = requests.get("https://g.tenor.com/v1/search", concrete_params)

    if request.status_code == 200:
        # load the GIFs using the urls for the smaller GIF sizes
        top_10_gifs = json.loads(request.content)
        print(request.__dict__.keys())
        top_10_gifs_json = request.json()
        pprint(top_10_gifs_json)

        with open('excited_gifs.json', 'w', encoding='utf-8') as w_json:
            json.dump(top_10_gifs_json, w_json, indent=4)
    else:
        print(f"Bad reques. Responce code is {request.status_code}")

except:
    Exception(f"Bad request. Response code is {request.status_code}")



# else:
#     top_8gifs = None
