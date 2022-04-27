#!/bin/bash

# Check For/Apply Updates
echo -ne "\033[3m\033[4;33mUpdating Termux.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>                                [20%]\033[0m\r"
apt update > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>                        [40%]\033[0m\r"
yes | apt full-upgrade > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>                [60%]\033[0m\r"
pkg update > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        [80%]\033[0m\r"
yes | pkg upgrade > /dev/null 2>&1;
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[1m\033[4;32mTermux has been updated.\033[0m\n"
sleep 1

# Cleanup Packages
echo -ne "\033[3m\033[4;33mCleaning up Termux packages.\033[0m\n"
sleep 1
echo -ne "\033[31m>>>>>>>>                                [20%]\033[0m\r"
apt clean > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>                        [40%]\033[0m\r"
apt autoclean > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>                [60%]\033[0m\r"
apt autoremove > /dev/null 2>&1;
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>        [80%]\033[0m\r"
pkg clean > /dev/null 2>&1 && pkg autoclean > /dev/null 2>&1;
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[1m\033[4;32mTermux Packages have been cleaned up.\033[0m\n"
exit
