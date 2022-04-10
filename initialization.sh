#!/bin/bash

# User Initialization Message
echo "Initializing Termux setup. This may take a few moments."

# Update Termux
apt update > /dev/null 2>&1;
yes | apt full-upgrade > /dev/null 2>&1;
pkg update > /dev/null 2>&1;
yes | pkg update > /dev/null 2>&1;

# Install Git
yes | pkg install git > /dev/null 2>&1;

# Clone Termux Repo
git clone https://github.com/UghDamnitDennis/Termux.git > /dev/null 2>&1;
git clone https://github.com/UghDamnitDennis/dev_termux.git > /dev/null 2>&1;

# Organize Files and Grant Necessary Permissions
cp /data/data/com.termux/files/home/Termux/setup/deviceselection.sh /data/data/com.termux/files/home/;
chmod +x deviceselection.sh;
./deviceselection.sh;
exit
