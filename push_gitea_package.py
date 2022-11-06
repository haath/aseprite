import os
import sys
import requests

BASE_URL = 'https://git.gmantaos.com/api'

file = sys.argv[1]
token = sys.argv[2]
tag = sys.argv[3]

file_name = os.path.basename(file)

url = f'{BASE_URL}/packages/haath/generic/aseprite/{tag}/{file_name}?token={token}'

with open(file, 'rb') as f:
    resp = requests.put(url, files={ 'attachment': f })

print(resp)
