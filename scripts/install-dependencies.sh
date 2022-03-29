#!/usr/bin/env bash

set -e -x

sudo apt-get update
sudo apt-get install --yes \
    python3-pip \
    python3-venv

pip3 install --upgrade "jupyterlab>=3.3.0"
pip3 uninstall markupsafe

sudo mkdir -p /opt/jupyterlab/etc/systemd
sudo cp ./scripts/jupyterlab.service /opt/jupyterlab/etc/systemd/

sudo ln -s /opt/jupyterlab/etc/systemd/jupyterlab.service /etc/systemd/system/jupyterlab.service
sudo systemctl daemon-reload
sudo systemctl enable jupyterlab.service
sudo systemctl start jupyterlab.service
sudo systemctl status jupyterlab.service
