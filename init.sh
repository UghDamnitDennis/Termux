#!/bin/bash

# GitHub Credentials
gituname="UghDamnitDennis"
gitemail="dennis.perryjr@outlook.com"
gittoken="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"
termuxrepo="https://UghDamnitDennis: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@github.com/UghDamnitDennis/Termux.git"

# Update Termux
clear
echo -ne "\033[3m\033[4m\033[34mUpdating Termux.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>                                [20%]\033[0m\r"
apt-get update > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>                        [40%]\033[0m\r"
yes | apt-get full-upgrade > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>                [60%]\033[0m\r"
pkg update > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        [80%]\033[0m\r"
yes | pkg upgrade > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep .25
echo -ne "\033[3m\033[4m\033[35mTermux updated successfully.\033[0m\n\n"
sleep 1

# Cleanup Packages
echo -ne "\033[3m\033[4m\033[34mCleaning up Termux.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>                                [20%]\033[0m\r"
apt clean > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>                        [40%]\033[0m\r"
apt autoclean > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>                [60%]\033[0m\r"
apt autoremove > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        [80%]\033[0m\r"
pkg clean > /dev/null 2>&1 && > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep .25
echo -ne "\033[3m\033[4m\033[35mTermux packages cleaned up successfully.\033[0m\n\n"
sleep 1

# Install Essential Packages
echo -ne "\033[3m\033[4m\033[34mInstalling essential packages.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>                                [20%]\033[0m\r"
yes | pkg install git > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>                        [40%]\033[0m\r"
yes | pkg install dialog > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>                [60%]\033[0m\r"
yes | pkg install man > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        [80%]\033[0m\r"
yes | pkg install mc > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep .25
echo -ne "\033[3m\033[4m\033[35mEssential packages installed successfully.\033[0m\n\n"
sleep 1

# Clone Termux Repo
echo -ne "\033[3m\033[4m\033[34mDownloading setup files.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
sleep .25
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
git clone $termuxrepo > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\r"
sleep.25
echo -ne "\033[3m\033[4m\033[35mTermux repo cloned successfully.\033[0m\n\n"
sleep 1

# Organize Files and Grant Permission
echo -ne "\033[3m\033[4m\033[34mOrganizing files and granting necessary permissions.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>>>>>>>>                         [33%]\033[0m\r"
mv /data/data/com.termux/files/home/Termux/setup/setup_type.sh /data/data/com.termux/files/home/
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>          [66%]\033[0m\r"
chmod +x setup_type.sh
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\r"
sleep .25
echo -ne "\033[3m\033[4m\033[35mFiles organized and permissions granted successfully.\033[0m\n\n"
sleep 1

# Prompt for Setup Readiness
while true; do
echo -ne "\033[1m\033[4m\033[34mAre you ready to launch Termux setup? [Y/N]\033[0m\n"
read ready_yn
    case $ready_yn in
        [yY]*) clear
               secs=$((5))
               while [ $secs -gt 0 ]; do
                   echo -ne "\033[3m\033[4m\033[36mLaunching Termux setup in:\033[0m \033[1\033[4;37;41$secs\033[0m\033[0K\r"
                   sleep 1
                   : $((secs--))
               done
               echo -ne "\n"
               clear
               ./setup_type.sh
               exit 1
               ;;
        [nN]*) echo -ne "\033[1m\033[4m\033[36mWhen you are ready to launch setup simply execute the 'setup_type' (./setup_type) script located in the HOME directory.\033[0m\n"
               exit 1
               ;;
           * ) echo -ne "\033[1m\033[4m\033[30;41mInvalid Selection.\033[0m\n"
               sleep .25
               >&2
    esac
done