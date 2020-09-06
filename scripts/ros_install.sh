#!/usr/bin/env zsh
ubuntu_version=0
ros_name=""
if grep -Eq "16.04" /etc/issue; then
    ubuntu_version=1604
    ros_name="kinetic"
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ xenial main" | sudo tee /etc/apt/sources.list.d/ros-latest.list
    curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
elif grep -Eq "18.04" /etc/issue; then
    ubuntu_version=1804
    ros_name="melodic"
    echo "deb https://mirrors.tuna.tsinghua.edu.cn/ros/ubuntu/ bionic main" | sudo tee /etc/apt/sources.list.d/ros-latest.list
    curl -sSL 'http://keyserver.ubuntu.com/pks/lookup?op=get&search=0xC1CF6E31E6BADE8868B172B4F42ED6FBAB17C654' | sudo apt-key add -
elif grep -Eq "20.04" /etc/issue; then
    ubuntu_version=2004
    ros_name="noetic"
fi

sudo apt update
sudo apt install -y ros-melodic-desktop-full

if test $ubuntu_version -lt 2004; then
# 初始化 rosdep
    sudo apt install -y python-rosdep
    sudo rosdep init
    rosdep update
else
    sudo apt -y install python3-rosdep
    sudo rosdep init
    rosdep update
fi

echo "source /opt/ros/${ros_name}/setup.zsh" >> ~/.zshrc
source ~/.zshrc