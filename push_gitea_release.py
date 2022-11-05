import os
import sys
import requests

BASE_URL = 'https://git.gmantaos.com/api/v1'

file = sys.argv[1]
token = sys.argv[2]
tag = sys.argv[3]

def get_release_with_tag(tag):
    url = f'{BASE_URL}/repos/haath/aseprite/releases/tags/{tag}?token={token}'
    resp = requests.get(url)
    data = resp.json()
    return data['id']

def release_add_file(release_id, file_path):
    url = f'{BASE_URL}/repos/haath/aseprite/releases/{release_id}/assets?token={token}'

    with open(file_path, 'rb') as f:
        resp = requests.post(url, files={ 'attachment': f })
        print(resp)


release_id = get_release_with_tag(tag)

release_add_file(release_id, file)
