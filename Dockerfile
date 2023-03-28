# https://qiita.com/conankonnako/items/787b69cd8cbfe7d7cb88

# https://hub.docker.com/layers/nvidia/cuda/11.7.0-devel-ubuntu22.04/images/sha256-a96add7c0d0aca800a37b712031af5dde048f7dadb6492786e4cd8317ad093e1?context=explore
FROM nvidia/cuda:11.7.0-devel-ubuntu22.04

ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
ENV DISPLAY host.docker.internal:0.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y tzdata
# timezone setting
ENV TZ=Asia/Tokyo 

WORKDIR /root

RUN apt-get update && apt-get upgrade -y
# RUN apt-get update
RUN apt-get install -y python3 python3-pip
# windows上でx-serverに接続するために必要
RUN apt-get install x11-apps -y
RUN apt-get install git -y
# matplotlibなどでの描画GUIに必要
RUN apt-get install python3-tk -y
RUN pip3 install torch torchvision


# ------------- ROS2のセットアップ

# https://qiita.com/porizou1/items/5dd915402e2990e4d95f
RUN apt-get install curl gnupg lsb-release -y

RUN curl -sSL https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -o /usr/share/keyrings/ros-archive-keyring.gpg

COPY setup.sh /root/

RUN bash ~/setup.sh

# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/ros-archive-keyring.gpg] http://packages.ros.org/ros2/ubuntu $(source /etc/os-release && echo $UBUNTU_CODENAME) main" | tee /etc/apt/sources.list.d/ros2.list > /dev/null && apt-get update
# RUN apt-get install ros-humble-desktop

# RUN echo "source /opt/ros/humble/setup.bash" >> ~/.bashrc

# # ------------- ワークスペースの作成
# RUN apt-get install python3-colcon-common-extensions -y
# RUN mkdir -p ~/ros2_ws/src
# RUN cd ~/ros2_ws/ && colcon build

# # ------------- Gazeboのインストール
# RUN apt -y install gazebo
# RUN apt install ros-humble-gazebo-*