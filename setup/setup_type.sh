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
                      while true; do
                          echo -ne ${INFO}"Setup is ready.\nWould you like to execute it now? [Y/N]\n"${CLR}
                          read setup_s_yn
                          case $setup_s_yn in
                              [yY]*) clear
                                     s_secs=$((3))
                                     while [ $s_secs -gt 0 ]; do
                                         echo -ne "\033[1;36mLaunching setup in: $s_secs\033[0m\033[0K\r"
                                         sleep 1
                                         : $((s_secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_s.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"When you are ready to execute Small Screen setup execute the setup_s.sh script located in the HOME directory.\n"${CLR}
                                     exit
                                     ;;
                                 * ) echo -ne ${URG}"Invalid selection."${CLR}
                                     sleep .25
                                     >&2
                          esac
                      done
               [lL]*) clear
                      echo -ne ${INFO}"Getting Large Screen setup ready.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/largescreen/setup_l.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_l.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      while true; do
                          echo -ne ${INFO}"Setup is ready.\nWould you like to run it now? [Y/N]\n"${CLR}
                          read setup_l_yn
                          case $setup_l_yn in
                              [yY]*) l_secs=$((3))
                                     while [ $l_secs -gt 0 ]; do
                                         echo -ne "\033[1;36mLaunching setup in: $l_secs\033[0m\033[0K\r"
                                         sleep 1
                                         : $((l_secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_l.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"When you are ready to execute Large Screen setup execute the setup_l.sh script located in the HOME directory.\n"${CLR}
                                     exit
                                     ;;
                                 * ) echo -ne ${URG}"Invalid selection."${CLR}
                                     sleep .25
                                     >&2
                          esac
                      done
               [bB]*) clear
                      echo -ne ${INFO}"Getting Basic setup ready.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/basic/setup_b.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_b.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      while true; do
                          echo -ne ${INFO}"Setup is ready.\nWould you like to run it now? [Y/N]"${CLR}
                          read setup_b_yn
                          case $setup_b_yn in
                              [yY]*) b_secs=$((3))
                                     while [ $b_secs -gt 0 ]; do
                                         echo -ne "\033[1;36mLaunching setup in: $b_secs\033[0m\033[0K\r"
                                         sleep 1
                                         : $((b_secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_b.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"When you are ready to exeute Basic Termux setup launch the setup_b.sh script located in the HOME directory.\n"${CLR}
                                     exit
                                     ;;
                          esac
                      done
               [qQ]*) echo -ne ${WARN}"Aborting.\n"${CLR}
                      exit
                      ;;
                  * ) echo -ne ${URG}"Invalid selection.\n"${CLR}
                      sleep .25
                      >&2
    esac
done