#!/bin/bash

# mysql config
#
# CREATE USER 'sammy'@'localhost' IDENTIFIED BY 'password';
# GRANT PRIVILEGE ON database.table TO 'username'@'host';
# GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'sammy'@'localhost' WITH GRANT OPTION;
# FLUSH PRIVILEGES;
#
# sudo mysql_secure_installation

# config git
git config --global user.email "combofish@163.com"
git config --global user.name "combofish"

# user config
sudo usermod -aG dialout "$USER" && sudo usermod -a -G dialout "$USER"

if [ "$SHELL" = "/usr/bin/zsh" ]; then
  echo "Current shell is zsh."
else
  echo "Current shell is not zsh."

  # 切换到zsh
  sudo chsh -s "$(which zsh)"
fi
