#!/usr/bin/env sh

# 备份文件
backup_file() {
  dest_path=$1

  if [ -e "$dest_path" ]; then
    # 文件已存在，备份并重命名
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup="$dest_path.$timestamp"
    echo "备份文件 $dest_path 为 $backup"
    mv "$dest_path" "$backup"
  fi
}

# 判断是否需要链接文件
is_need_to_link_file_path() {
  file_path=$1
  dest_path=$2

  if test -e "$file_path" -a -e "$dest_path"; then
    cmp --quiet "$file_path" "$dest_path"
    if [ ! "$0" ]; then
      # 文件不相同，先备份文件
      backup_file "$dest_path"
      return 1
    else
      # 文件相同，不用复制
      echo "( $file_path ) and ( $dest_path ) are same file, skip link."
      return 0
    fi
  else
    echo "( $dest_path ) does not exist, need to link."
    # 文件不存在
    return 1
  fi
}

# 链接配置文件
link_config_file() {
  file_path=$1
  dest_path=$2

  is_need_to_link_file_path "$file_path" "$dest_path"
  if [ ! "$0" ]; then
    # 复制文件到目标位置
    echo "链接文件 $file_path 到 $dest_path"
    ln "$file_path" "$dest_path"
  fi
}

#set -x

# vimrc
link_config_file ./config/.vimrc "$HOME/.vimrc"

# shrc
link_config_file ./config/.shrc "$HOME/.shrc"

# zshrc
link_config_file ./config/.zshrc "$HOME/.zshrc"

# condarc
link_config_file ./config/.condarc "$HOME/.condarc"

# Xresources
link_config_file ./config/.Xresources "$HOME/.Xresources"

#set +x
