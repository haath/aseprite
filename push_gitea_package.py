import os
import sys
import requests

BASE_URL = 'https://git.gmantaos.com/api'

file = sys.argv[1]
tag = sys.argv[2]
token = os.environ['GITEA_API_KEY']

file_name = os.path.basename(file)

url = f'{BASE_URL}/packages/haath/generic/aseprite/{tag}/{file_name}?token={token}'

with open(file, 'rb') as f:
    resp = requests.put(url, files={ 'attachment': f })

print(resp)
