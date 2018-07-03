#! /bin/bash

apt-get update
apt-get install -y vim
apt-get install -y libsm6
apt-get install -y libxrender1
apt-get install -y libxext-dev
apt-get install -y git

pip install keras
pip install opencv-python
pip install tensorboard