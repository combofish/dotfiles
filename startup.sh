#!/bin/bash

# change work dir
cd "$HOME/GitProjects/dotfiles/" || exit

# 定义要执行的目录
directory="./startup.conf.d/"

## 打开调试模式
#set -x

# update first
sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade

# 遍历目录中的所有文件
for file in "${directory}"/*; do
  # 检查文件是否是可执行文件
  if [ -x "$file" ]; then
    # 执行可执行文件
    ./"$file"
  fi
done

# config git
git config --global user.email "combofish@163.com"
git config --global user.name "combofish"

# user config
sudo usermod -aG dialout "$USER" && sudo usermod -a -G dialout "$USER"

# auto remove
sudo apt autoremove -y

## 关闭调试模式
#set +x

echo "done!"
