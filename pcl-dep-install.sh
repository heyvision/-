#!/usr/bin/env bash
set -ev

sudo apt-get update
sudo apt-get --yes install git build-essential linux-libc-dev || true
sudo apt-get --yes install cmake cmake-gui || true
sudo apt-get --yes install libusb-1.0-0-dev libusb-dev libudev-dev || true
sudo apt-get --yes install mpi-default-dev openmpi-bin openmpi-common || true
sudo apt-get --yes install libflann1.8 libflann-dev || true
sudo apt-get --yes install libeigen3-dev || true
sudo apt-get --yes install libboost-all-dev || true
sudo apt-get --yes install libgtest-dev || true
sudo apt-get --yes install freeglut3-dev pkg-config || true
sudo apt-get --yes install libxmu-dev libxi-dev || true
sudo apt-get --yes install mono-complete || true
sudo apt-get --yes install qt-sdk openjdk-8-jdk openjdk-8-jre || true
sudo apt-get --yes install libopenni-dev || true
sudo apt-get --yes install libopenni2-dev || true
sudo apt-get --yes install qt5-default || true
