#!/usr/bin/python

from __future__ import print_function

import shutil
import sys

import yaml
import requests

with open('image-sources.yaml') as f:
    image_sources = yaml.load(f)

for filename, url in image_sources['download'].items():
    print('Downloading %s' % (filename,))
    sys.stdout.flush()
    stream = requests.get(url, stream=True)
    with open(filename, 'wb') as f:
        shutil.copyfileobj(stream.raw, f)
