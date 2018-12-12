#!/usr/bin/python3

import shutil

import yaml
import requests

with open('image-sources.yaml') as f:
    image_sources = yaml.load(f)

for filename, url in image_sources['download'].items():
    stream = requests.get(url, stream=True)
    with open(filename, 'wb') as f:
        shutil.copyfileobj(stream.raw, f)
