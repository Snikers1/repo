"""Посмотреть документацию к API GitHub, разобраться как вывести список репозиториев
   для конкретного пользователя, сохранить JSON-вывод в файле *.json."""

import requests
from pprint import pprint
import json

username = 'Snikers1'
repositories = dict()

try:
    request = requests.get(f'https://api.github.com/users/{username}/repos')
    if request.ok:
        # print(request.status_code)
        # print(request.__dict__.keys())
        # pprint(request_json)
        # print(len(request_json))

        request_json = request.json()

        for i in range(len(request_json)):
            repositories[request_json[i]['name']] = request_json[i]['url']

        #pprint(repositories)

        with open("repositories.json", "w", encoding="utf-8") as f_json:
            json.dump(repositories, f_json, indent=2)

except:
    Exception(f"Bad request. Response code is {request.status_code}")





