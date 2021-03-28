#!/usr/bin/zsh
# author:combofish
# email:combofish49@gmail.com 
# Filename: software.sh

# sudo apt install ros-noetic-ros-base
# sudo apt install ros-noetic-desktop
# sudo apt install ros-noetic-desktop-full
# sudo apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential
# sudo rosdep init
# rosdep update 

config_setup_ros(){
    # 
    sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
    sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
    sudo apt update
    sudo apt install ros-noetic-desktop-full

    # echo "source /opt/ros/melodic/setup.zsh" >> ~/.zshrc
    # source ~/.zshrc
    sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

}

config_setup_ros_workspace(){
    mkdir -p ~/workspace/catkin_ws/src
    cd ~/workspace/catkin_ws/
    catkin_make
}

config_ros_pcl_openni(){
    sudo apt-get install -y ros-melodic-openni-launch
}

config_ros_pcl(){
    cd ~/workspace/catkin_ws/src/
    catkin_create_pkg my_pcl_tutorial pcl_conversions pcl_ros roscpp sensor_msgs
}

config_qtcreator(){
    sudo apt-get update
    sudo apt-get install -y qtcreator
}

script(){
    echo ">>> script..."
    ## python env. no use.
    # config_python_envs
    # config_python_envs_cv

    sudo rosdep init
    rosdep update

    ## ROS
    # config_setup_ros
    config_setup_ros_workspace
    config_ros_pcl_openni

    # config_ros_pcl
    config_qtcreator
    
    # config_python_modules
    # config_software
}

script
