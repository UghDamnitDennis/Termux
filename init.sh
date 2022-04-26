#!/bin/bash

# Update Termux
clear
echo -ne "\033[3m\033[4m\033[33mUpdating Termux.\033[0m\n"
sleep 1
apt-get update > /dev/null 2>&1
echo -ne "\033[31m>>>         [25%]\033[0m\r"
sleep .25
yes | apt-get full-upgrade > /dev/null 2>&1
echo -ne "\033[31m>>>>>>      [50%]\033[0m\r"
sleep .25
pkg update > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>   [75%]\033[0m\r"
sleep .25
yes | pkg upgrade > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[3m\033[4m\033[36mTermux updated successfully.\033[0m\n\n"
sleep 1

# Cleanup Packages
echo -ne "\033[3m\033[4m\033[33mCleaning up Termux.\033[0m\n"
sleep 1
apt clean > /dev/null 2>&1
echo -ne "\033[31m>>>         [25%]\033[0m\r"
sleep .25
apt autoclean > /dev/null 2>&1
echo -ne "\033[31m>>>>>>      [50%]\033[0m\r"
sleep .25
apt autoremove > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>   [75%]\033[0m\r"
sleep .25
pkg clean > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[3m\033[4m\033[36mTermux packages cleaned up successfully.\033[0m\n\n"
sleep 1

# Install Essential Packages
echo -ne "\033[3m\033[4m\033[33mInstalling essential packages.\033[0m\n"
sleep 1
yes | pkg install git > /dev/null 2>&1
echo -ne "\033[31m>>>         [25%]\033[0m\r"
sleep .25
yes | pkg install dialog > /dev/null 2>&1
echo -ne "\033[31m>>>>>>      [50%]\033[0m\r"
sleep .25
yes | pkg install man > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>   [75%]\033[0m\r"
sleep .25
yes | pkg install mc > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[3m\033[4m\033[36mEssential packages installed successfully.\033[0m\n\n"
sleep 1

# Clone Termux Repo
echo -ne "\033[3m\033[4m\033[33mDownloading setup files.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>        [33%]\033[0m\r"
sleep .25
echo -ne "\033[31m>>>>>>>>    [66%]\033[0m\r"
sleep .25
git clone https://github.com/UghDamnitDennis/Termux.git > /dev/null 2>&1
echo -ne "\033[32m>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[3m\033[4m\033[36mTermux repo cloned successfully.\033[0m\n\n"
sleep 1

# Organize Files and Grant Permission
echo -ne "\033[3m\033[4m\033[33mOrganizing files and granting necessary permissions.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>        [33%]\033[0m\r"
sleep .25
cp /data/data/com.termux/files/home/Termux/setup/setup_type.sh /data/data/com.termux/files/home/
echo -ne "\033[31m>>>>>>>>    [66%]\033[0m\r"
sleep .25
chmod +x setup_type.sh
echo -ne "\033[32m>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[3m\033[4m\033[36mFiles organized and permissions granted successfully.\033[0m\n\n"
sleep 1
while true; do
echo -ne "\033[3m\033[4m\033[34mAre you ready to launch Termux setup? [Y/N]\033[0m\n"
read ready_yn
    case $ready_yn in
        [yY]*|"") clear
                  secs=$((5))
                  while [ $secs -gt 0 ]; do
                      echo -ne "\033[1m\033[4m\033[33mLaunching Termux setup in: $secs\033[0m\033[0K\r"
                      sleep 1
                      : $((secs--))
                  done
                  echo -ne "\n"
                  clear && ./setup_type.sh
                  exit 1
                  ;;
           [nN]*) echo -ne "\033[1m\033[4m\033[31mWhen you are ready to launch setup simply execute the 'setup_type' (./setup_type) script located in the HOME directory.\033[0m\n"
                  sleep 1
                  exit 1
                  ;;
              * ) echo -ne "\033[1m\033[4m\033[31;40mInvalid Selection.\033[0m\n"
                  sleep .25
                  >&2
    esac
done