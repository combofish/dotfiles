#!/usr/bin/env sh

set -x

backup_and_ln() {
  file=$1
  dest=$2

  if [ -e "$dest" ]; then
    # 文件已存在，备份并重命名
    timestamp=$(date +"%Y%m%d_%H%M%S")
    backup="$dest.$timestamp"
    echo "备份文件 $dest 为 $backup"
    cp "$dest" "$backup"
  fi

  # 复制文件到目标位置
  echo "复制文件 $file 到 $dest"
  ln "$file" "$dest"
}

# vimrc
backup_and_ln ./config/.vimrc "$HOME/.vimrc"

# shrc
backup_and_ln ./config/.shrc "$HOME/.shrc"

# zshrc
backup_and_ln ./config/.zshrc "$HOME/.zshrc"

# condarc
backup_and_ln ./config/.condarc "$HOME/.condarc"

# Xresources
backup_and_ln ./config/.Xresources "$HOME/.Xresources"

set +x
