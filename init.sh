#!/bin/bash

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
git clone https://github.com/UghDamnitDennis/Termux.git > /dev/null 2>&1
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep.25
echo -ne "\033[3m\033[4m\033[35mSetup files downloaded successfully.\033[0m\n\n"
sleep 1

# Organize Files and Grant Permission
echo -ne "\033[3m\033[4m\033[34mGetting setup files ready.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>>>>>>>>                         [33%]\033[0m\r"
mv /data/data/com.termux/files/home/Termux/setup/setup_type.sh /data/data/com.termux/files/home/
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>          [66%]\033[0m\r"
chmod +x setup_type.sh
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep .25
echo -ne "\033[3m\033[4m\033[35mFiles are ready.\033[0m\n\n"
sleep 1

# Launch Setup
secs=$((5))
if [ $secs -gt 0 ]; do
    echo -ne "\033[1;36mLaunching setup in: $secs\033[0m\033[0K\r"
    sleep 1
    : $((secs--))
done
clear
bash setup_type.sh
exit
