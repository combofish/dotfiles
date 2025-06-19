#!/usr/bin/env sh

repos_dir="$HOME/GitProjects"

dir_or_execute(){
  if [ ! -d "$1" ];then
    echo "dir $1 do not existed!."
    eval "$2"
  fi
}

# personal repos
repo_blog="$repos_dir/combofish.github.io"
repo_notes="$repos_dir/carve-in-mind"
repo_code="$repos_dir/chips-get"
repo_leetcode="$repos_dir/leetcode-solutions-cpp"
repo_web_server="$repos_dir/tiny-web-server"

# tools
repo_zsh="$repos_dir/ohmyzsh"
repo_zsh_sugg="$repos_dir/ohmyzsh/plugins/zsh-autosuggestions"
repo_zsh_high="$repos_dir/ohmyzsh/plugins/zsh-syntax-highlighting"
# repo_zsh_conda="$repos_dir/ohmyzsh/plugins/zsh-syntax-highlighting"

# dir_or_execute "$repo_blog" "git clone git@github.com:combofish/combofish.github.io.git $repo_blog"
# dir_or_execute "$repo_notes" "git clone git@github.com:combofish/carve-in-mind.git $repo_notes"
# dir_or_execute "$repo_code" "git clone git@github.com:combofish/chips-get.git $repo_code"
# dir_or_execute "$repo_leetcode" "git clone git@github.com:combofish/leetcode-solutions-cpp.git $repo_leetcode"
# dir_or_execute "$repo_web_server" "git clone git@github.com:combofish/tiny-web-server.git $repo_web_server"


# dir_or_execute "$repo_zsh" "git clone https://github.com/ohmyzsh/ohmyzsh $repo_zsh"it
dir_or_execute "$repo_zsh_sugg" "git clone https://github.com/zsh-users/zsh-autosuggestions $repo_zsh_sugg"
dir_or_execute "$repo_zsh_high" "git clone https://github.com/zsh-users/zsh-syntax-highlighting $repo_zsh_high"

set +x
