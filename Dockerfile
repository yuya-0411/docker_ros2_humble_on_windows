# ------------ ベースイメージファイル
FROM nvidia/cuda:11.7.0-devel-ubuntu22.04

# ------------ 環境設定
ENV LIBRARY_PATH /usr/local/cuda/lib64/stubs
ENV DISPLAY host.docker.internal:0.0
ENV DEBIAN_FRONTEND=noninteractive

# ------------ タイムゾーンの設定
RUN apt-get update && apt-get install -y tzdata
ENV TZ=Asia/Tokyo 

# ------------ ワークディレクトリの設定
WORKDIR /root

# ------------ Ubuntu上での環境構築
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y python3 python3-pip

# windows上でx-serverに接続するために必要なx11-appsのインストール
RUN apt-get install x11-apps -y

# gitのインストール（20.04以降はデフォルトでインストールされていない）
RUN apt-get install git -y

# matplotlibなどでの描画GUIに必要
RUN apt-get install python3-tk -y

# PyTorchのためのライブラリをインストール
RUN pip3 install torch torchvision

# ------------ ROS2のセットアップ
COPY setup.sh /root/
RUN bash ~/setup.sh