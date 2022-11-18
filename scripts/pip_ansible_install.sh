#!/usr/bin/env bash

set -Eeuo pipefail

# On ubuntu python 3.10 and package "python3-distutils" should already be installed
curl -fSL -# https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py
sudo python3 /tmp/get-pip.py

# Install the latest version of ansible using pip
sudo python3 -m pip install ansible

# Clean residual files
rm -f /tmp/get-pip.py
