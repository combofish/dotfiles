#/usr/bin/env sh

# make local log
# auto exec by .bashrc

neofetch_logfile=".logs/neofetch.log"
pistatus_logfile=".logs/pistatus.log"


echo -e "\n$(date)\n" >> $HOME/$neofetch_logfile
echo -e "\n$(date)\n" >> $HOME/$pistatus_logfile


neofetch_log(){
    neofetch >> $HOME/$neofetch_logfile
}

pistatus_log(){
    $HOME/.bin/getinfo.sh >> $HOME/$pistatus_logfile
}

neofetch_log
pistatus_log

