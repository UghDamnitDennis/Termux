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
                      echo -ne ${INFO}"Small Device setup selected.\nOrganizing files and granting necessary permissions.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/smallscreen/setup_s.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_s.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      while true; do
                          echo -ne ${INFO}"Small Screen setup is ready.\nWould you like to execute it now? [Y/N]\n"${CLR}
                          read setup_s_yn
                          case $setup_s_yn in
                              [yY]*) clear
                                     secs=$((3))
                                     while [ $secs -gt 0 ]; do
                                         echo -ne ${INFO}"Launching Small Screen setup in: $secs\033[0K\r"${CLR}
                                         sleep 1
                                         : $((secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_s.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"You have selected to abort Small Screen setup.\nShould you decide to execute Small Screen setup later simply launch the setup_s.sh script (./setup_s.sh) located in the Termux HOME directory.\n"${CLR}
                                     exit
                                     ;;
                          esac
                      done
               [lL]*) clear
                      echo -ne ${INFO}"Large Device setup selected.\nOrganizing files and granting necessary permissions.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/largescreen/setup_l.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_l.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      while true; do
                          echo -ne ${INFO}"Large Screen setup is ready.\nWould you like to run it now? [Y/N]\n"${CLR}
                          read setup_l_yn
                          case $setup_l_yn in
                              [yY]*) secs=$((3))
                                     while [ $secs -gt 0 ]; do
                                         echo -ne ${INFO}"Launching Large Screen setup in: $secs\033[0K\r"${CLR}
                                         sleep 1
                                         : $((secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_l.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"You have selected to abort Large Screen setup.\nShould you decide to execute Large Screen setup later simply execute the setup_l.sh script (./setup_l.sh) located in the Termux HOME directory.\n"${CLR}
                                     exit
                                     ;;
                          esac
                      done
            [bB]*|"") clear
                      echo -ne ${INFO}"Basic setup selected.\nOrganizing files and granting necessary permissions.\n"${CLR}
                      sleep 1
                      echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                      mv /data/data/com.termux/files/home/Termux/setup/basic/setup_b.sh /data/data/com.termux/files/home/
                      echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                      chmod +x setup_b.sh
                      echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                      while true; do
                          echo -ne ${INFO}"Basic Termux setup is ready.\nWould you like to run it now? [Y/N]"${CLR}
                          read setup_b_yn
                          case $setup_b_yn in
                              [yY]*) secs=$((3))
                                     while [ $secs -gt 0 ]; do
                                         echo -ne ${INFO}"Launching Basic Termux setup in: $secs\033[0K\r"${CLR}
                                         sleep 1
                                         : $((secs--))
                                         echo -ne "\n"
                                     done
                                     ./setup_b.sh
                                     exit
                                     ;;
                              [nN]*) echo -ne ${WARN}"You have selected to abort Basic Termux setup.\nShould you decide to execute Basic Termux setup later simply launch the setup_b.sh script (./setup_b.sh) located in the Termux HOME directory.\n"${CLR}
                                     exit
                                     ;;
                          esac
                      done
               [qQ]*) echo -ne ${WARN}"Aborting Termux setup.\n"${CLR}
                      exit
                      ;;
    esac
done