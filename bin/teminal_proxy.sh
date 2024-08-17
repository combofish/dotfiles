#!/bin/sh
# author:combofish
# email:combofish49@gmail.com
# Filename: teminal_proxy.sh

export proxy_server_addr=127.0.0.1
export proxy_server_port=1080

# 开启代理
proxy_on() {
  export ALL_PROXY=socks5://127.0.0.1:$proxy_server_port # 注意你的端口号可能不是1087，注意修改
  export http_proxy=http://127.0.0.1:$proxy_server_port
  export https_proxy=http://127.0.0.1:$proxy_server_port
  echo "已开启代理"
}

# 关闭代理
proxy_off() {
  unset ALL_PROXY
  unset http_proxy
  unset https_proxy
  echo "已关闭代理"
}
