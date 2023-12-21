#!/usr/bin/env python3
'''
Author: larry combofish@163.com
Date: 2023-12-21 09:27:20
LastEditors: larry combofish@163.com
LastEditTime: 2023-12-21 14:26:48
FilePath: /dotfiles/startup.conf.d/install_pkgs.py
Description: install pkgs
'''

import subprocess
from icecream import ic
from pathlib import Path


# dev pkgs
dev_pkgs = """
    build-essential ninja-build openssl libssl-dev
    openssh-client openssh-server
    
    # Dev Softwares
    nodejs npm  golang lua5.3 rustc llvm lldb
    
    # Build Tools
    cmake cmake-qt-gui
    python3 flake8
    ninja-build maven gradle
    libboost-all-dev
    
    # Database
    mysql-server mysql-client libmysqlclient-dev sqlite3

    # build kernel
    git fakeroot build-essential libncurses-dev
    xz-utils libssl-dev bc
    flex libelf-dev bison dwarves zstd
    
    # Tools
    ncdu cloc net-tools tree neofetch
    vim zsh rxvt-unicode ffmpeg flameshot samba
    cifs-utils fd-find ripgrep
    octave qtcreator
    neofetch ntfs-3g telnet curl net-tools vim inetutils-ping nmap filezilla
    thunar okular ranger htop at glances kazam gimp whowatch arandr
    
    # Font
    fcitx-config-gtk fonts-wqy-microhei
    
    # KVM Software
    qemu virt-manager virt-viewer libvirt-daemon-system libvirt-clients
    
    # Tex Software
    texlive-full texmaker texstudio
    
    # Embedded Software
    minicom setserial putty gtkterm screen
    
    # Other
    tesseract-ocr tesseract-ocr-eng libtesseract-dev arduino android-sdk adb
    libgoogle-glog-dev libgflags-dev libfreetype6-dev libharfbuzz-dev
    
    # TODO : Need Repo
    # mysql-workbench-community
"""


def startup_r(cmd: str, prefix='', tag='exec', quiet=True):
    prefix = Path(__file__).name if prefix == '' else prefix
    print(f"\033[0;31m{prefix}\033[0m - {tag} - {cmd}")

    if quiet:
        subprocess.run(f" {cmd} 1> /dev/null", shell=True)
    else:
        subprocess.run(f" {cmd}", shell=True)


def _format_pkgs(pkg_str: str) -> str:
    dev_pkgs = [item.strip() for item in pkg_str.split('\n')]
    dev_pkgs = [item for item in dev_pkgs if item !=
                '' and not item.startswith('#')]

    inst_pkgs = []
    for item in dev_pkgs:
        inst_pkgs.extend(item.strip().split(' '))

    inst_pkgs = list(set(inst_pkgs))
    inst_pkgs.sort()

    # ic(inst_pkgs)

    # for item in inst_pkgs:
    #     print(item)

    return ' '.join(inst_pkgs)


if __name__ == '__main__':

    # update
    startup_r('sudo apt-get update -y')
    startup_r('sudo apt-get upgrade -y')
    startup_r('sudo apt-get dist-upgrade -y')

    # install pkgs
    pkgs = _format_pkgs(dev_pkgs)
    startup_r(f'sudo apt-get install {pkgs}')

    # auto remove
    startup_r('sudo apt-get autoremove -y')

    """Other code
    config font
    if sudo dpkg -s fonts-font-awesome > /dev/null; then
      sudo apt-get install fonts-font-awesome && fc-list >/dev/null && sudo fc-cache -f -v >/dev/null
    fi

    ruby
    gem update --system
    gem update

    input
    sudo apt-get remove -y ibus 1>/dev/null
    sudo apt-get install -y fcitx5 fcitx5-chinese-addons fcitx5-frontend-qt5 1>/dev/null

    不要用脚本自动安装带有安装交互的软件包
    kubuntu-desktop xfce4
    
    """
