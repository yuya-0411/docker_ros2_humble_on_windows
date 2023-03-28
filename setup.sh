#!/bin/bash -e 

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null

apt-get update

apt-get install ros-humble-desktop -y

echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

apt-get install python3-colcon-common-extensions -y

mkdir -p ~/ros2_ws/src

cd ~/ros2_ws/ && colcon build

echo "source ~/ros2_ws/install/setup.bash" >> ~/.bashrc

apt-get install gazebo -y

apt-get install ros-humble-gazebo-* -y

source ~/.bashrc