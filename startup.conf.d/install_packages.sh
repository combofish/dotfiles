#!/usr/bin/env sh

echo "apt-get install ..."

set -x

# update first
sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y

# install
# [remove] macs ruby-dev code
# nodejs npm

sudo apt-get install -y golang python3 lua5.3 rustc \
  maven gradle mysql-server octave \
  cmake cmake-qt-gui llvm clang clangd lldb flake8 ninja-build ntfs-3g clangd-12 \
  thunar okular ranger htop glances kazam gimp whowatch ncdu cloc net-tools adb tree neofetch \
  vim zsh rxvt-unicode ffmpeg flameshot samba cifs-utils fd-find ripgrep \
  fcitx-config-gtk fonts-wqy-microhei qtcreator \
  tesseract-ocr tesseract-ocr-eng libtesseract-dev arduino android-sdk \
  1>/dev/null

# build kernel
# sudo apt-get install git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison dwarves zstd

# kvm software
# sudo apt-get install -y qemu-kvm qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients

# embedded software
# sudo apt-get install -y minicom setserial putty gtkterm screen

# tex software
# sudo apt-get install -y texlive-full texmaker texstudio

# ccat
# go get github.com/owenthereal/ccat@latest

# config font
# if sudo dpkg -s fonts-font-awesome > /dev/null; then
#   sudo apt-get install fonts-font-awesome && fc-list >/dev/null && sudo fc-cache -f -v >/dev/null
# fi

# ruby
## gem update --system
# gem update

# input
sudo apt-get remove -y ibus 1>/dev/null
sudo apt-get install -y fcitx5 fcitx5-chinese-addons fcitx5-frontend-qt5 1>/dev/null

# 不要用脚本自动安装带有安装交互的软件包
# kubuntu-desktop xfce4

# auto remove
sudo apt-get autoremove -y

set +x
