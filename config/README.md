# dotfiles

Config files & Install scripts uesd for building development environment timely on linux system.

一些配置文件和几个安装脚本，用于在 Linux 系统上及时构建出一个可用的开发环境。

## Introduce

这里有本人在 Linux 系统上常用的配置文件，包括但不止于 `.vimrc`, `.zshrc`, `.shrc`, `.bashrc`, `.condarc`, `.konsolerc`,
以及用于配置环境的安装脚本 `startup.py`。

配置文件适用于大多数 Linux 系统，但安装脚本编写于 `Ubuntu 20.04 LTS`, 其他发行版未做测试，可修改后使用。

安装脚本借鉴了 [Gentoo Portage](https://wiki.gentoo.org/wiki/Portage) 中用 USE 管理软件功能的方法。
为系统环境配置中不同的功能设置了不同的 `USE Flag`, `USE Flag` 的具体功能见 `startup.py` 的注释，
可根据需要配置所需的环境。

## USE Flag 介绍

| USE                 | Function                                                                                |
|---------------------|-----------------------------------------------------------------------------------------|
| base_softwares      | 安装所需要的基础软件                                                                    |
| software_debs       | 自动安装在 ./Software_debs 目录下的 *.deb 和 执行 *.sh 文件, 可在此目录放置第三方安装包 |
| kvm_softwares       | 安装使用 kvm 所需的软件                                                                 |
| tex                 | 安装使用 tex 所需的软件                                                                 |
| embedded            | 安装一些串口软件                                                                        |
| font                | 更新字体                                                                                |
| emacs27             | 用 snap 安装 Emacs， 版本较新                                                           |
| vscode              | 用 snap 安装 Vs code， 版本较新                                                         |
| go_tools            | 下载一些用 go 语言写的工具软件                                                          |
| base_config         | 替换自己的配置文件（vimrc，.bashrc 等）                                                 |
| zsh_config          | 配置使用自己的 zsh 配置文件，并自动安装 ohmyzsh 等插件，并自动切换 Shell                |
| mysql_config        | 安装 mysql 后的配置                                                                     |
| emacs_editor_config | 配置 Emacs，使用的是自己的配置文件，见 github.com/combofish/emacs.d.git                 |
| conda_use           | 使用 conda 构建一个 Python3.8 的环境与                                                  |
| autoremove          | 自动清楚不需要的软件包依赖                                                              |

## Usage

记得在运行脚本之前，检查一下自己所需的 USE Flag。

```shell
git clone https://combofish.com/combofish/dotfiles.git
cd dotfiles && python ./startup.py
```
