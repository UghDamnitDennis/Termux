#!/bin/bash

# Text Style and Color
CLR=$(echo -e '\033[0m')
INFO=$(echo -e '\033[3;32m')
USER=$(echo -e '\033[4;33m')
OPT=$(echo -e '\033[3\033[4;35m')
WARN=$(echo -e '\033[1;31;43m')
URG=$(echo -e '\033[1\033[7;31m')

# Select Backup to Restore
ls -lA /storage/emulated/0/termux/backups/;
echo ${USER}"Select a backup you would like to restore from:"${CLR};
read -p {USER}"Enter FULL file name:"${CLR} user_rest_sel
echo ${INFO}"Beginning restore from $user_rest_sel."${CLR};
tar -zxf /storage/emulated/0/termux/backups/$user_rest_sel -C /data/data/com.termux/files --recursive-unlink --preserve-permissions;
echo ${INFO}"Restore complete."${CLR};sleep 0.25s;
exit
