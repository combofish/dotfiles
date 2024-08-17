#!/usr/bin/zsh
# author:combofish
# email:combofish49@gmail.com
# Filename: i3dm.sh

config_pre_i3() {
  deps=(rofi conky xscreensaver feh rofi konsole i3status i3blocks xcompmgr kde-standard) #shutter
  sudo apt-get install "${deps[@]}"
}

config_i3blocks() {
  if [ ! -d ~/.config/i3blocks/ ]; then
    mkdir ~/.config/i3blocks
  fi
}

config_i3() {
  if [ ! -d ~/.config/i3/ ]; then
    mkdir -p ~/.config/i3/
  fi

  if [ -f ~/.config/i3/config ]; then
    mv ~/.config/i3/config ~/.config/i3/config-"$(date +"%m-%d-%Y")".bak
  fi

  # !!! run path.
  ln ./../i3/config ~/.config/i3/config
}

config_i3dm() {
  echo "config i3"

  ## i3 desktop manager
  config_pre_i3
  config_i3blocks
  config_i3
}

# config_i3dm # Move to ./use.sh
