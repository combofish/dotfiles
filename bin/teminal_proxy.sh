#!/bin/sh
# author:combofish
# email:combofish49@gmail.com 
# Filename: teminal_proxy.sh

export proxyserveraddr=127.0.0.1
export proxyserverport=1080

# 开启代理
function proxy_on(){
    export ALL_PROXY=socks5://127.0.0.1:$proxyserverport  # 注意你的端口号可能不是1087，注意修改
    export http_proxy=http://127.0.0.1:$proxyserverport
    export https_proxy=http://127.0.0.1:$proxyserverport
    echo -e "已开启代理"
}

# 关闭代理
function proxy_off(){
    unset ALL_PROXY
    unset http_proxy
    unset https_proxy
    echo -e "已关闭代理"
}
