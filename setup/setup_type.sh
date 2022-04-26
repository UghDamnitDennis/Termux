#!/bin/bash

# Style Variables
CLR=$(echo -e '\033[0m')
INFO=$(echo -e '\033[3;32m')
WARN=$(echo -e '\033[1;30;43m')
URG=$(echo -e '\033[1;30;41m')
USER=$(echo -e '\033[4;36m')
OPT=$(echo -e '\033[3m\033[4;34m')

# Device Selection
echo ${USER}'Please select a device size to launch the appropriate setup script.'${CLR};
echo ${OPT}'1 - Small Screen Device'${CLR};
echo ${OPT}'2 - Large Screen Device'${CLR};
echo ${OPT}'3 - Basic Setup (skip device specific configuration files, etc.)'${CLR};
echo ${OPT}'4 - Abort Setup'${CLR};
read -p ${USER}'Please make a selection:'${CLR} dev_type
    case $dev_type in
        1) echo ${INFO}'Organizing files and granting necessary permissions.'${CLR};sleep 0.25s;
           cp /data/data/com.termux/files/home/Termux/setup/smallscreensetup.sh /data/data/com.termux/files/home/;
           chmod +x smallscreensetup.sh;
           echo ${INFO}'Launching small screen device setup.'${CLR};sleep 0.25s;
           ./smallscreensetup.sh
           ;;
        2) echo ${INFO}'Organizing files and granting necessary permissions.'${CLR};sleep 0.25s;
           cp /data/data/com.termux/files/home/Termux/setup/largescreensetup.sh /data/data/com.termux/files/home/;
           chmod +x largescreensetup.sh;
           echo ${INFO}'Launching large screen device setup.'${CLR};sleep 0.25s;
           ./largescreensetup.sh
           ;;
        3) echo ${INFO}'Organizing files and granting necessary permissions.'${CLR};sleep 0.25s;
           cp /data/data/com.termux/files/home/Termux/setup/basicsetup.sh /data/data/com.termux/files/home/;
           chmod +x basicsetup.sh;
           echo ${INFO}'Launching basic (non-device specific) Termux setup.'${CLR};sleep 0.25s;
           ./basicsetup.sh
           ;;
        4) echo ${WARN}'Aborting Termux setup.'${CLR};sleep 0.25s;
           exit
           ;;
    esac
done