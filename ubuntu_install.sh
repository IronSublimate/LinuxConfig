#!/bin/sh
# 换源 
sudo mv /etc/apt/sources.list /etc/apt/sources.list.back
if grep -Eq "16.04" /etc/issue; then
    # 16.04
    echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ xenial-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list
elif grep -Eq "18.04" /etc/issue; then
    # 18.04
    echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ bionic-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list
    # 20.04
elif grep -Eq "20.04" /etc/issue; then
    echo "# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-backports main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ focal-security main restricted universe multiverse" | sudo tee /etc/apt/sources.list

fi
# 更新
sudo apt update
sudo apt upgrade

# sudo 免密码
echo "$USER ALL=(ALL:ALL) NOPASSWD:ALL" | tee -a /etc/sudoers

# 安装zsh
sudo apt install zsh -y
# oh-my-zsh
cd ~
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# zsh-syntax-highlighting
cd ~/.oh-my-zsh/plugins &&
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git 

# 下载常用的配置文件
cd ~
if test -e ~/.vimrc; then
    mv ~/.vimrc ~/.vimrc.old
fi
if test -e ~/.zshrc; then
    mv ~/.zshrc ~/.zshrc.old
fi
wget https://raw.githubusercontent.com/IronSublimate/LinuxConfig/master/home/.vimrc
wget https://raw.githubusercontent.com/IronSublimate/LinuxConfig/master/home/.zshrc

# 下载常用软件
sudo apt install -y neofetch sl build-essential python3-pip proxychains4

# pip换源
sudo pip3 install pip -U
sudo pip3 config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
