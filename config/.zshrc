

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

# export ZSH=$HOME/.oh-my-zsh
# export ZSH=$HOME/Documents/ohmyzsh
export ZSH=$HOME/GitProjects/ohmyzsh
# [[ -f ~/.shrc ]] && . ~/.shrc

# add to .zshrc

### change PATH
export PATH=$HOME/.local/bin:$PATH
export GOPATH=$HOME/GoProjects
export PATH=$PATH:$GOPATH/bin

# export DOTFILES=$HOME/Documents/dotfiles
export DOTFILES=$HOME/GitProjects/dotfiles
export PATH=$PATH:$DOTFILES/bin

export PATH=$PATH:$HOME/.local/bin

# doom-emacs
export PATH=$PATH:$HOME/.emacs.d/bin

# snap
export PATH=/snap/bin:$PATH

# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$PATH:$HOME/gems/bin"

# Android Studio
# export PATH=$PATH:$HOME/Downloads/android-studio/bin

# export C_INCLUDE_PATH=/usr/include
# export CPLUS_INCLUDE_PATH=/usr/include

# CUDA
export CUDA=/usr/local/cuda
export PATH=$PATH:$CUDA/bin
export C_INCLUDE_PATH=/usr/local/cuda/targets/x86_64-linux/include:$C_INCLUDE_PATH
export CPLUS_INCLUDE_PATH=/usr/local/cuda/targets/x86_64-linux/include:$CPLUS_INCLUDE_PATH
export LD_LIBRARY_PATH=$CUDA/lib:$CUDA/lib64:$LD_LIBRARY_PATH

# TensorRT
TENSORRT_ROOT=${HOME}/.local
TENSORRT_VERSION='8.5.3.1'
export PATH=${TENSORRT_ROOT}/TensorRT-${TENSORRT_VERSION}/bin:${PATH}
export LD_LIBRARY_PATH=${TENSORRT_ROOT}/TensorRT-${TENSORRT_VERSION}/lib:${LD_LIBRARY_PATH}

# pkg-config
# For opencv4
PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/lib/pkgconfig
export PKG_CONFIG_PATH

# Maven
export MAVEN_HOME=/usr/share/maven
export PATH=$MAVEN_HOME/bin:$PATH

# JAVA
export JAVA_HOME=/usr/lib/jvm/java-14-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
# export CLASSPATH=.:$JAVA_HOME/jre/lib/rt.jar:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar 

# conda
if [ -d "${HOME}/anaconda3/"]; then
    source $HOME/anaconda3/etc/profile.d/conda.sh
else if [ -d "${HOME}/miniconda3/" ]; then
    source ${HOME}/miniconda3/etc/profile.d/conda.sh   
fi

# ros
# source /opt/ros/noetic/setup.zsh
# source /opt/ros/ /opt/ros/melodic/setup.zsh
# source ~/workspace/catkin_ws/devel/setup.zsh

# proxy
# source $DOTFILES/bin/teminal_proxy.sh

# IBUS
# export GTK_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
# export QT_IM_MODULE=ibus

# fcitx
export GTK_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"
export QT_IM_MODULE=fcitx

### alias
alias lm="ls -la | more"
alias h="history"
alias chmodx="chmod u+x"
alias ipython="ipython --pylab"
alias g2a="g++ --std=c++2a"
alias py3="time python3"
alias clr="clear"
# alias cat="ccat"
alias wget6="wget --inet6-only"

# apt-get 
alias apts="sudo apt-cache search"
alias apti="sudo apt-get install"

export GOPROXY=https://goproxy.io
export GO111MODULE=on

release_name=`uname -r | cut -d '-' -f 2`
if test $release_name = 'gentoo' ; then
    #### alias on gentoo
    alias eqf='equery f'
    alias equ='equery u'
    alias eqh='equery h'
    alias eqa='equery a'
    alias eqb='equery b'
    alias eql='equery l'
    alias eqd='equery d'
    alias eqg='equery g'
    alias eqc='equery c'
    alias eqk='equery k'
    alias eqm='equery m'
    alias eqy='equery y'
    alias eqs='equery s'
    alias eqw='equery w'

    
    ### used in gentoo
    export PATH=$HOME/Downloads/gcc-arm-none-eabi-8-2018-q4-major/bin/:$PATH
    export PATH=$HOME/.bin/stm32loader/:$PATH
    export PATH=$HOME/.gem/ruby/2.3.0/bin/:$PATH
    #export NODE_ENV=production
    export NODE_ENV=development

fi

unset release_name

### used in arch
#export ZSH=$HOME/sources/oh-my-zsh

### val
export brightness="/sys/class/backlight/intel_backlight/brightness"
export max_brightness="/sys/class//backlight/intel_backlight/max_brightness"


# added by Anaconda3 5.3.1 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '$HOME/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/home/larry/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/larry/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/home/larry/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<


alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
# alias -s html=mate 
# alias -s rb=mate
# alias -s py=vi
# alias -s js=vi
# alias -s c=vi
# alias -s java=vi
# alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

bindkey '`' autosuggest-accept

# Correction
# setopt correctall

# FILE ~/.zshrcEnabling Portage completions and Gentoo prompt for zsh
autoload -U compinit promptinit
compinit
promptinit
# promptinit; prompt gentoo

# To enable a cache for the completions add:
# FILE ~/.zshrcEnabling cache for the completions for zsh
zstyle ':completion::complete:*' use-cache 1


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git
         # autojump
         zsh-autosuggestions
         zsh-syntax-highlighting
         golang
         emacs)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#PATH="/home/larry/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/larry/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/larry/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/larry/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/larry/perl5"; export PERL_MM_OPT;

