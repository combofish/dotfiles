#!/usr/bin/env sh

modules_list=(numpy scipy pandas scikit-learn tornado pillow)
modules_list_py=(pyPdf python-nmap pygeoip mechanize BeautifulSoup4)
# requests flask scrapy djingo pyramid wheezy.web
# SerialTool

function install_pkg()
{
    echo "Install: $1"
    pip install $1 --user $USER
    echo "Install $1 done."
    return 0
    
}

#for module in "${modules_list[@]}"
for module in "${modules_list_py[@]}"
do
    install_pkg $module
done

# pip install ipython[all] --user $USER

