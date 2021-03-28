#!/bin/zsh
# author:combofish
# email:combofish49@gmail.com 
# Filename: softwares_pre_install.sh

# install softwares that use frequency.
config_software(){
    softwares=(arduino tree golang python3.8 thunar arduino okular ranger htop glances whowatch ncdu lua5.3 rustc npm xfce4 cloc net-tools adb gradle android-sdk neofetch) # golang ruby python java g++ gcc
    sudo apt-get -y install ${softwares[@]}
    # xfce4 cloc 
}

# for i3-gaps
# sudo add-apt-repository ppa:kgilmer/speed-ricer
# sudo apt-get install i3-gaps
# sudo apt-get install polybar

config_software_emacs(){
    snap install emacs --beta --classic
}

config_software_kvm(){
    sudo apt-get -y install qemu-kvm qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients
    # sudo systemctl start libvirtd
    # sudo systemctl enable libvirtd
}

# config_software_kvm
# config_software
# config_software_emacs

# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb

# ls /sys/class/net
# ls /etc/netplan/

# 678  sudo apt-get install fonts-font-awesome
#   679  fc
#   680  fc-list

# sudo fc-cache -f -v



# git config --global user.email "combofish@139.com"
# git config --global user.name "combofish"


# wget https://github.com/betaflight/betaflight-configurator/releases/download/10.7.0/betaflight-configurator_10.7.0_amd64.deb
# sudo usermod -aG dialout ${USER}
# sudo usermod -a -G dialout $USER

# sudo apt-get install minicom
# setserial
# putty
# gtkterm
# screen

# ffmpeg

## sudo apt-get install texlive-full texmaker
# sudo add-apt-repository ppa:sunderme/texstudio 
# sudo apt-get install texstudio

# sudo apt-get install ibus-sunpinyin

# IBus输入法安装和设置
# IBus是一个框架，支持多种输入法。

# 安裝IBus框架：
# 在终端输入命令:
# sudo apt-get install ibus ibus-clutter ibus-gtk ibus-gtk3 ibus-qt4
# 启用IBus框架：
# 在终端输入:
# im-switch -s ibus
# 重新启动X（也可以重启电脑）

# 安装拼音引擎：
# 在终端输入:
# sudo apt-get install ibus-pinyin
# 设置ibus-pinyin，在终端输入:
# /usr/lib/ibus-pinyin/ibus-setup-pinyin
# 安装sunpinyin模块，在终端输入:
# sudo apt-get install ibus-sunpinyin
# 设置ibus-sunpinyin，在终端输入:
# /usr/lib/ibus-sunpinyin/ibus-setup-sunpinyin
# 安装五笔引擎：
# 在终端输入:
# sudo apt-get install ibus-table-wubi
# 设置IBus框架：
# 在终端输入:
# ibus-setup
# fcitx


fcitx-config-gtk
sudo apt-get install fonts-wqy-microhei
sudo apt-get install mysql-server
sudo mysql_secure_installation

CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
GRANT PRIVILEGE ON database.table TO 'username'@'host';
GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;


systemctl enable mysql

