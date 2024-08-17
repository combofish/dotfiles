#!/usr/bin/env sh
###
 # @Author: combofish combofish@163.com
 # @Date: 2024-08-06 12:56:46
 # @LastEditors: combofish combofish@163.com
 # @LastEditTime: 2024-08-16 17:59:50
 # @FilePath: /dotfiles/startup.conf.d/clone_git_repos.sh
 # @Description: 
### 

repos_dir="$HOME/GitProjects"

dir_or_execute(){
  if [ ! -d "$1" ];then
    echo "dir $1 do not existed!."
    eval "$2"
  fi
}

# personal repos
# repo_blog="$repos_dir/combofish.github.io"
# repo_notes="$repos_dir/carve-in-mind"
# repo_code="$repos_dir/chips-get"
# repo_leetcode="$repos_dir/leetcode-solutions-cpp"
# repo_web_server="$repos_dir/tiny-web-server"

# tools
repo_zsh="$repos_dir/ohmyzsh"
repo_zsh_sugg="$repos_dir/ohmyzsh/plugins/zsh-autosuggestions"
repo_zsh_high="$repos_dir/ohmyzsh/plugins/zsh-syntax-highlighting"

# dir_or_execute "$repo_blog" "git clone git@github.com:combofish/combofish.github.io.git $repo_blog"
# dir_or_execute "$repo_notes" "git clone git@github.com:combofish/carve-in-mind.git $repo_notes"
# dir_or_execute "$repo_code" "git clone git@github.com:combofish/chips-get.git $repo_code"
# dir_or_execute "$repo_leetcode" "git clone git@github.com:combofish/leetcode-solutions-cpp.git $repo_leetcode"
# dir_or_execute "$repo_web_server" "git clone git@github.com:combofish/tiny-web-server.git $repo_web_server"


dir_or_execute "$repo_zsh" "git clone git@github.com:ohmyzsh/ohmyzsh.git $repo_zsh"
dir_or_execute "$repo_zsh_sugg" "git clone git@github.com:zsh-users/zsh-autosuggestions.git $repo_zsh_sugg"
dir_or_execute "$repo_zsh_high" "git clone git@github.com:zsh-users/zsh-syntax-highlighting.git $repo_zsh_high"

set +x
``