#!/bin/bash

#cuda-9.0 is not campatiable with the current tensorflow version
#we need install cuda-8.0 and cuda-6.0 for cuda8
#pelase check installing information and uninstall cuda-9.0
#   https://gist.github.com/mjdietzx/0ff77af5ae60622ce6ed8c4d9b419f45
#   https://devtalk.nvidia.com/default/topic/1024342/cuda-setup-and-installation/unable-to-uninstall-cuda-9-0-completely-and-install-8-0-instead/
#   https://developer.nvidia.com/cuda-toolkit-archive (cudn history source)
#   http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#runfile-uninstallation


# update repositories and upgrade packages
apt-get update
apt-get --assume-yes upgrade

# install python and tools
apt-get --assume-yes install nano
apt-get --assume-yes install python python-dev python-pip
apt-get --assume-yes install python3 python3-dev python3-pip

#install cuda-8-0
#!/bin/bash
echo "Checking for CUDA and installing."
# Check for CUDA and try to install.
if ! dpkg-query -W cuda-8-0; then
  # The 16.04 installer works with 16.10.
  curl -O http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  dpkg -i ./cuda-repo-ubuntu1604_8.0.61-1_amd64.deb
  apt-get update
  apt-get install cuda-8-0 -y
fi


# install cuDNN v6.0
CUDNN_TAR_FILE="cudnn-8.0-linux-x64-v6.0.tgz"
wget http://developer.download.nvidia.com/compute/redist/cudnn/v6.0/${CUDNN_TAR_FILE}
tar -xzvf ${CUDNN_TAR_FILE}
sudo cp -P cuda/include/cudnn.h /usr/local/cuda-8.0/include
sudo cp -P cuda/lib64/libcudnn* /usr/local/cuda-8.0/lib64/
sudo chmod a+r /usr/local/cuda-8.0/lib64/libcudnn*

#64 bit check info: http://docs.nvidia.com/cuda/cuda-installation-guide-linux/#runfile-uninstallation
export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
#the below two lines may have the duplicated funtion with the above two lines but if you meet
#a problem when import tensorflow, please run them
echo "/usr/local/cuda-8.0/lib64" >  /etc/ld.so.conf.d/nvidia.conf
echo "/usr/local/cuda-8.0/lib" >  /etc/ld.so.conf.d/nvidia.conf

# install python packages for machine learning
yes | pip2 install --upgrade pip
yes | pip3 install --upgrade pip
yes | pip2 install pillow matplotlib mpmath jupyter pandas keras sklearn tensorflow tensorflow-gpu
yes | pip3 install pillow matplotlib mpmath jupyter pandas keras sklearn tensorflow tensorflow-gpu
yes | pip2 install h5py
yes | pip3 install h5py
yes | pip2 install scikit-image
yes | pip3 install scikit-image

# install pytorch. if you need insall pytorch, uncomment the below two lines
#pip2 install http://download.pytorch.org/whl/cu80/torch-0.2.0.post3-cp27-cp27mu-manylinux1_x86_64.whl
#pip2 install torchvision

# set up jupyter (for Python 2.7)
jupyter notebook --allow-root --generate-config
echo "c.NotebookApp.ip = '*'" >> /root/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> /root/.jupyter/jupyter_notebook_config.py
python2 -m ipykernel install

# clean up
cd /home
rm -r ./downloads