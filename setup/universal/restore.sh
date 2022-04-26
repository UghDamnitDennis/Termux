#!/bin/bash

# Directory Variable
bdir="storage/emulated/0/termux/backups/"

# Restore Termux
cd /storage/emulated/0/termux/backups/
clear
ls | column -t
echo -ne "\033[3m\033[4;36mSelect the backup which you would like to restore. Enter the DATE then press ENTER:\033[0m \n"
read bdate
bfull="$bdir$bdate_termux-backup.tar.gz"
if [[ -f "$bfull" ]]
then
    echo -ne "\033[3;33mRestoring backup from $bdate.\033[0m\n"
    sleep 1
    echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
    tar -zxf $bfull -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
    echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
    sleep 3
    echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
    sleep .25
    echo -ne "\033[1m\033[4;32mRestore complete.\033[0m\n\n"
else
    echo -ne "\033[1;30;41m$bdate_termux-backup.tar.gz was not found in $bdir. Check spelling and try again.\033[0m\n"
    cd /data/data/com.termux/files/home/
    exit
fi
cd /data/data/com.termux/files/home/
exit
