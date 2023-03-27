#!/usr/bin/env sh

repos_dir="$HOME/GitProjects"

dir_or_execute(){
  if [ ! -d "$1" ];then
    echo "dir $1 do not existed!."
    eval "$2"
  fi
}

repo_blog="$repos_dir/combofish.github.io"
repo_notes="$repos_dir/carve-in-mind"
repo_code="$repos_dir/chips-get"


repo_zsh="$repos_dir/ohmyzsh"
repo_zsh_sugg="$repos_dir/ohmyzsh/plugins/zsh-autosuggestions"
repo_zsh_high="$repos_dir/ohmyzsh/plugins/zsh-syntax-highlighting"

dir_or_execute "$repo_blog" "git clone git@github.com:combofish/combofish.github.io.git $repo_blog"
dir_or_execute "$repo_notes" "git clone git@github.com:combofish/chips-get.git $repo_notes"
dir_or_execute "$repo_code" "git clone git@github.com:combofish/carve-in-mind.git $repo_code"


dir_or_execute "$repo_zsh" "git clone git@github.com:ohmyzsh/ohmyzsh.git $repo_zsh"
dir_or_execute "$repo_zsh_sugg" "git clone git@github.com:zsh-users/zsh-autosuggestions.git $repo_zsh_sugg"
dir_or_execute "$repo_zsh_high" "git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $repo_zsh_high"

if [ "$SHELL" = "/usr/bin/zsh" ]; then
  echo "Current shell is zsh."
else
  echo "Current shell is not zsh."
  chsh -s "$(which zsh)" # 切换到zsh
fi

set +x
