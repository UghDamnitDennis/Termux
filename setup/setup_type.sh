#!/bin/bash

# Delete init.sh
[ -f "/data/data/com.termux/files/home/init.sh" && rm -rf /data/data/com.termux/files/home/init.sh || clear;echo -ne "\033[1;33mSelect a Termux setup for the current installation.\033[0m\n"

# Device Selection
while true; do
    echo -ne "\033[1m\033[4;36m[S]mall Screen Device\033[0m\n\033[1m\033[4;36m[L]arge Screen Device\033[0m\n\033[1m\033[4;36m[B]asic (non-device specific) Setup\033[0m\n\033[1m\033[4;36m[Q]uit\033[0m\n"
    read setup_type
    case $setup_type in
                  [sS]*) clear
                         echo -ne "\033[3;33mGetting Small Screen setup ready.\033[0m\n"
                         sleep 1
                         echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                         mv /data/data/com.termux/files/home/Termux/setup/smallscreen/setup_s.sh /data/data/com.termux/files/home/
                         echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                         chmod +x setup_s.sh
                         echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                         secs=$((3))
                         if [ $secs -gt 0 ]; do
                             echo -ne "\033[1;34mLaunching setup in: $secs\033[0m\033[0K\r"
                             sleep 1
                             : $((secs--))
                         done
                         echo -ne "\n"
                         ./setup_s.sh
                         exit
                         ;;
                  [lL]*) clear
                         echo -ne "\033[3;33mGetting Large Screen setup ready.\033[0m\n"
                         sleep 1
                         echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                         mv /data/data/com.termux/files/home/Termux/setup/largescreen/setup_l.sh /data/data/com.termux/files/home/
                         echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                         chmod +x setup_l.sh
                         echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                         secs=$((3))
                         if [ $secs -gt 0 ]; do
                             echo -ne "\033;1;34mLaunching setup in: $secs\033[0m\033[0K\r"
                             sleep 1
                             : $((secs--))
                         done
                         echo -ne "\n"
                         ./setup_l.sh
                         exit
                         ;;
               [bB]*|"") clear
                         echo -ne "\033[3;33mGetting Basic setup ready.\033[0m\n"
                         sleep 1
                         echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
                         mv /data/data/com.termux/files/home/Termux/setup/basic/setup_b.sh /data/data/com.termux/files/home/
                         echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
                         chmod +x setup_b.sh
                         echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
                         secs=$((3))
                         if [ $secs -gt 0 ]; do
                             echo -ne "\033;1;34mLaunching setup in: $secs\033[0m\033[0K\r"
                             sleep 1
                             : $((secs--))
                         done
                         echo -ne "\n"
                         ./setup_b.sh
                         exit
                         ;;
                  [qQ]*) echo -ne "\033[1m\033[4;30;41mAborting.\033[0m\n"
                         exit
                         ;;
                     * ) echo -ne "\033[1m\033[4;30;43mInvalid selection.\033[0m\n"
                         sleep .25
                         >&2
    esac
done
