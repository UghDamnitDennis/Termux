#!/bin/bash

# Text Style and Color
CLR=$(echo -e '\033[0m')
INFO=$(echo -e '\033[3;32m')
USER=$(echo -e '\033[4;33m')
OPT=$(echo -e '\033[3\033[4;35m')
WARN=$(echo -e '\033[1;31;43m')
URG=$(echo -e '\033[1\033[7;31m')

# Check For/Apply Updates
echo ${INFO}"Updating Termux packages."${CLR};sleep 0.25s;
apt update > /dev/null 2>&1;
yes | apt full-upgrade > /dev/null 2>&1;
pkg update > /dev/null 2>&1;
yes | pkg upgrade > /dev/null 2>&1;
echo ${INFO}"Packages updated."${CLR};sleep 0.25s;

# Cleanup
echo ${INFO}"Cleaning up packages."${CLR};sleep 0.25s;
apt clean > /dev/null 2>&1;
apt autoclean > /dev/null 2>&1;
apt autoremove > /dev/null 2>&1;
pkg clean > /dev/null 2>&1;
pkg autoclean > /dev/null 2>&1;
echo ${INFO}"Packages cleaned up."${CLR};sleep 0.25s;
exit
