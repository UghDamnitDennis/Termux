#!/bin/bash

# Style Variables
CLR=$(echo -e '\033[0m')
INFO=$(echo -e '\033[3;32m')
WARN=$(echo -e '\033[1;30;43m')
URG=$(echo -e '\033[1;30;41m')
USER=$(echo -e '\033[4;36m')
OPT=$(echo -e '\033[3m\033[4;34m')

# Delete init.sh
[ -f "/data/data/com.termux/files/home/init.sh" ] && rm -rf /data/data/com.termux/files/home/init.sh

# Device Selection
clear
echo -ne ${USER}"Please select a Termux setup type for current installation."${CLR};
while true; do
    echo -ne ${OPT}"[S]mall Screen Device\n[L]arge Screen Device\n[B]asic (non-device specific) Setup\n[Q]uit\n"
    read setup_type
    case $setup_type in
               [sS]*) clear
                      echo -ne ${INFO}"Getting Small Screen setup ready.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/smallscreen/setup_s.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_s.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      ./setup_s.sh
                      exit
                      ;;
               [lL]*) clear
                      echo -ne ${INFO}"Getting Large Screen setup ready.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/largescreen/setup_l.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_l.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      ./setup_l.sh
                      exit
                      ;;
               [bB]*) clear
                      echo -ne ${INFO}"Getting Basic setup ready.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/basic/setup_b.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_b.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      ./setup_b.sh
                      exit
                      ;;
               [qQ]*) echo -ne ${URG}"Aborting.\n"${CLR}
                      exit
                      ;;
                  * ) echo -ne ${WARN}"Invalid selection.\n"${CLR}
                      sleep .25
                      >&2
    esac
done