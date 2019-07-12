# 安装教程（基于Ubuntu 16.04）

## OpenCV
1. step1: 下载解压opencv和对应的contrib，根据教程使用apt-get install下载各种依赖包  
    * `sudo apt-get install build-essential`  
    * `sudo apt-get install cmake git libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev`  
    * `sudo apt-get install python-dev python-numpy libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libjasper-dev libdc1394-22-dev`  
    * [ippicv face_landmark_model.dat download](https://blog.csdn.net/CSDN330/article/details/86747867)  
2. step2: opencv文件夹下新建build文件夹，执行下面命令  
    * 编译OpenCV时若要安装viz模块，需要安装libvtk5-dev而且cmake时加上-DWITH_VTK=ON 
    * FOR EXAMPLE: `cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local/opencv4 -DOPENCV_GENERATE_PKGCONFIG=ON -D WITH_VTK=ON -DOPENCV_EXTRA_MODULES_PATH=../opencv_contrib-4.0.0/modules  -D OPENCV_ENABLE_NONFREE=ON ..`    
3. step3: `make -j8 && make install`  
4. step4(optional): `sudo gedit /etc/ld.so.conf.d/opencv.conf`，末尾添加/usr/local/opencv4/lib，然后`sudo ldconfig`  
5. step5(optional): `sudo gedit /etc/bash.bashrc`，末尾添加      
    ```bash
    PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opencv4/lib/pkgconfig  
    export PKG_CONFIG_PATH  
    ```
	  然后执行`source /etc/bash.bashrc`  
    
## Nvidia驱动
[ubuntu16.04教程](https://www.cnblogs.com/xinyf/p/5960480.html)

## CUDA
1. [CUDA下载](https://developer.nvidia.com/cuda-downloads)
2. `sudo sh cuda_8.0.61_375.26_linux.run`  
    除了不安装驱动，其他选yes（或者x）
3. sudo gedit ~/.bashrc (sudo gedit ~/.zshrc)添加下面两行
     ```bash
     export PATH=$PATH:/usr/local/cuda-10.1/bin
     export LD_LIBRARY_PATH=$PATH:/usr/local/cuda-10.1/lib64
     ```
    完成后source ~/.bashrc (source ~/.zshrc)
    
## cudnn
1. [cudnn下载](https://developer.nvidia.com/rdp/cudnn-archive)  
注意与cuda版本匹配  
2. sudo dpkg -i libcudnn7_7.5.0.56-1+cuda10.1_amd64.deb  
sudo dpkg -i libcudnn7-dev_7.5.0.56-1+cuda10.1_amd64.deb  
sudo dpkg -i libcudnn7-doc_7.5.0.56-1+cuda10.1_amd64.deb  

## PCL
1. [源码下载](https://github.com/PointCloudLibrary/pcl)并解压
2.  sudo apt-get update  
    sudo apt-get install git build-essential linux-libc-dev  
    sudo apt-get install cmake cmake-gui   
    sudo apt-get install libusb-1.0-0-dev libusb-dev libudev-dev  
    sudo apt-get install mpi-default-dev openmpi-bin openmpi-common    
    sudo apt-get install libflann1.8 libflann-dev  
    sudo apt-get install libeigen3-dev  
    sudo apt-get install libboost-all-dev  
    sudo apt-get install libgtest-dev  
    sudo apt-get install freeglut3-dev pkg-config  
    sudo apt-get install libxmu-dev libxi-dev  
    sudo apt-get install mono-complete  
    sudo apt-get install qt-sdk openjdk-8-jdk openjdk-8-jre  
    sudo apt-get install libopenni-dev   
    sudo apt-get install libopenni2-dev  
    sudo apt-get install qt5-default
    (Or install for once. Run as follows:  
    ./[pcl-dep-install.sh](./pcl-dep-install.sh))
3. 安装VTK（至少6.2版本）  
[VTK下载](https://vtk.org/download/)  
依赖opengl（sudo apt-get install freeglut3-dev）   
下载完成后mkdir build; cd build; cmake .. ; sudo make && sudo make install
4. 安装PCL
    * mkdir build  
    * cd build  
    * 编译
        * cmake-gui  勾选BUILD_GPU BUILD_CUDA BUILD_apps BUILD_examples BUILD_surface然后configure,将新出现的红色勾选后再configure，最后generate  
        * 或者cmake -DCMAKE_BUILD_TYPE=None  -DBUILD_GPU=ON  -DBUILD_apps=ON  -DBUILD_examples=ON -DBUILD_surface=ON -DBUILD_CUDA=ON ..  
        运行时会提示：  
        -- The following subsystems will not be built:  
        --   cuda_sample_consensus: Requires common.  
        --   cuda_segmentation: Requires common.  
        --   cuda_io: Disabled by default.  
        --   cuda_features: Requires common.  
        --   cuda_apps: Disabled manually.  
        --   gpu_tracking: Disabled by default.  
        --   gpu_surface: Disabled by default.  
        --   gpu_kinfu_large_scale: Requires surface.  
        --   gpu_people: Disabled by default.  
        --   global_tests: No reason  
        --   simulation: Disabled by default.
    * make -j4
    * sudo make install

## realsense
[教程](https://github.com/IntelRealSense/librealsense/blob/master/doc/distribution_linux.md)  

## open3d
1. [教程](http://www.open3d.org/docs/compilation.html#ubuntu)  
    * 使用pip install时报错TypeError: unsupported operand type(s) for -=: 'Retry' and 'int'的解决办法:  
`sudo python -m pip install --upgrade --force pip`  
    * [pip升级后Import Error:cannot import name main](https://blog.csdn.net/zong596568821xp/article/details/80410416)  
    `sudo gedit /usr/bin/pip` 修改`from pip._internal import main`
2. cmake时  
    * download [3rdparty](https://github.com/intel-isl/Open3D-3rdparty/tree/adac428ffa79f9e0e0a17878b5b246295d53dbb3) to 3rdparty file and [pybind](https://github.com/pybind/pybind11) to 3rdparty/pybind11
    * ```sudo cmake -DBUILD_GLFW=ON -DPYTHON_EXECUTABLE=`which python` ..```
