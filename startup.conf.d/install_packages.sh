#!/usr/bin/env sh

echo "apt-get install ..."

set -x

# install
sudo apt-get install -y golang python3 lua5.3 rustc \
  npm maven gradle mysql-server octave \
  cmake cmake-qt-gui llvm clang clangd lldb flake8 ninja-build ntfs-3g clangd-12 \
  thunar okular ranger htop glances kazam gimp whowatch ncdu cloc net-tools adb tree neofetch \
  vim zsh rxvt-unicode ffmpeg flameshot samba cifs-utils fd-find ripgrep \
  fcitx-config-gtk fonts-wqy-microhei qtcreator \
  tesseract-ocr tesseract-ocr-eng libtesseract-dev arduino android-sdk # macs \

# kvm software
# sudo apt-get install -y qemu-kvm qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients

# embedded software
# sudo apt-get install -y minicom setserial putty gtkterm screen

# tex software
# sudo apt-get install -y texlive-full texmaker texstudio

# mysql config
#
# CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
# GRANT PRIVILEGE ON database.table TO 'username'@'host';
# GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
#
# sudo mysql_secure_installation

# ccat
# go install github.com/owenthereal/ccat@latest

# config font
# sudo dpkg -s fonts-font-awesome
# if [ ! "$0" ]; then
if sudo dpkg -s fonts-font-awesome; then
  sudo apt-get install fonts-font-awesome && fc-list >/dev/null && sudo fc-cache -f -v >/dev/null
fi

# input
sudo apt remove ibus
sudo apt install fcitx5 fcitx5-chinese-addons fcitx5-frontend-qt5

# 不要用脚本自动安装带有安装交互的软件包
# kubuntu-desktop xfce4

# install clion
sudo snap install clion --classic

# install vscode
sudo snap install code --classic

# install emacs
sudo snap install --beta --classic emacs

# install pycharm
sudo snap install pycharm-community --classic
sudo snap install pycharm-professional --classic

# update
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt autoremove && sudo snap refresh

set +x
