# author:combofish
# email:combofish49@gmail.com 
# Filename: tools.sh

# software: useful tools
config_tools(){
    # ccat
    go get -u github.com/owenthereal/ccat
    echo $(ccat -v)
}
