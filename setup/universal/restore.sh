#!/bin/bash

# Directory Variable
#bdir="storage/emulated/0/termux/backups/"
bdir="/storage/emulated/0/dummy_dir/"

# Restore Termux
#cd /storage/emulated/0/termux/backups/
cd /storage/emulated/0/dummy_dir/
clear
#lsa
ls -lA
#echo -ne "\033[3m\033[4;36mSelect the backup which you would like to restore. Enter the DATE then press ENTER:\033[0m \n"
#read bdate
#bfull="$bdir$bdate_termux-backup.tar.gz"
#if [[ -f "$bfull" ]]
#then
#    echo -ne "\033[3;33mRestoring backup from $bdate.\033[0m\n"
#    sleep 1
#    echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
#    tar -zxf $bfull -C /data/data/com.termux/files --recursive-unlink --preserve-permissions
#    echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
#    sleep 3
#    echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
#    sleep .25
#    echo -ne "\033[1m\033[4;32mRestore complete.\033[0m\n\n"
#else
#    echo -ne "\033[1;30;41m$bdate_termux-backup.tar.gz was not found in $bdir. Check spelling and try again.\033[0m\n"
#    cd /data/data/com.termux/files/home/
#    exit
#fi
#cd /data/data/com.termux/files/home/
#exit
echo -ne "\033[3m\033[4;36mSelect a file. Enter the NAME then press ENTER:\033[0m \n"
read bname
bfull="$bdir$bname.txt"
if [[ -f "$bfull" ]]
then
    echo -ne "\033[3;33mYou selected $bfull.\033[0m\n"
    sleep 1
    echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
    sleep 3
    echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
    sleep 3
    echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
    sleep 1
    echo -ne "\033[33m-------------------------------------------------------\033[0m\n"
    echo $bfull
    echo -ne "\033[33m-------------------------------------------------------\033[0m\n"
else
    echo -ne "\033[1;30;41m$bname.txt was not found in $bdir. Check the spelling and try again.\033[0m\n"
    cd /data/data/com.termux/files/home/
    exit
fi
cd /data/data/com.termux/files/home/
exit
