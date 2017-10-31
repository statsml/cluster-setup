#!/bin/bash

# update repositories and upgrade packages
apt-get update
apt-get --assume-yes upgrade

# install python and tools
apt-get --assume-yes install nano
apt-get --assume-yes install python python-dev python-pip
apt-get --assume-yes install python3 python3-dev python3-pip

mkdir /home/downloads
cd /home/downloads

# download and install CUDA
wget http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
apt-get update
apt-get --assume-yes install cuda

# install python packages for machine learning
yes | pip2 install --upgrade pip
yes | pip3 install --upgrade pip
yes | pip2 install pillow matplotlib mpmath jupyter pandas keras sklearn tensorflow tensorflow-gpu
yes | pip3 install pillow matplotlib mpmath jupyter pandas keras sklearn tensorflow tensorflow-gpu

# install pytorch
pip2 install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl
pip2 install torchvision

# set up jupyter (for Python 2.7)
jupyter notebook --allow-root --generate-config
echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py
python2 -m ipykernel install

# clean up
cd /home
rm -r ./downloads
