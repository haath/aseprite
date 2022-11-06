import os
import sys
import requests

BASE_URL = 'https://git.gmantaos.com/api/v1'

file = sys.argv[1]
token = sys.argv[2]
tag = sys.argv[3]

def create_release_with_tag(tag):
    url = f'{BASE_URL}/repos/haath/aseprite/releases/?token={token}'
    resp = requests.post(url, data={
        'name': tag,
        'title': tag,
        'tag_name': tag
    })
    data = resp.json()

    if 'id' not in data:
        raise Exception(f'unable to create release, error: {resp["message"]}')

    return data['id']

def get_release_with_tag(tag):
    url = f'{BASE_URL}/repos/haath/aseprite/releases/tags/{tag}?token={token}'
    resp = requests.get(url)
    data = resp.json()

    if 'id' not in data:
        # release doesn't exist yet, create it
        return create_release_with_tag(tag)

    return data['id']

def release_add_file(release_id, file_path):
    url = f'{BASE_URL}/repos/haath/aseprite/releases/{release_id}/assets?token={token}'

    with open(file_path, 'rb') as f:
        resp = requests.post(url, files={ 'attachment': f })
        print(resp)


release_id = get_release_with_tag(tag)

release_add_file(release_id, file)
