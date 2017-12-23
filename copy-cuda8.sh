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


# matplot
export MPLBACKEND="agg"