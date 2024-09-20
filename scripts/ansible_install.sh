#!/usr/bin/env bash

set -Eeuo pipefail

# This script requires a parameter to work properly
if [ "$#" -ne 1 ]; then
    echo "Please provide the absolute path where a Python venv with Ansible will be created (e.g. '/home/undeb/ansible-venv')"
    exit 2
fi

# Install the venv package as installing Python packages system-wide is not recommended
sudo apt update
sudo apt install -y python3.12-venv

# Create a venv
python3 -m venv $1

# Install the latest version of ansible using pip
$1/bin/python3 -m pip install --upgrade ansible

# Display useful information for ansible configuration later on
cat << EOF

The ansible install script finished successfully :)
To run ansible playbooks, provide the following interpreter as 'ansible_playbook_python' variable in 'vars.yml':

$1/bin/python3

EOF
