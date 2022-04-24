#!/bin/bash

# Text Style and Color
CLR=$(echo -e '\033[0m')
INFO=$(echo -e '\033[3;32m')
USER=$(echo -e '\033[4;33m')
OPT=$(echo -e '\033[3\033[4;35m')
WARN=$(echo -e '\033[1;31;43m')
URG=$(echo -e '\033[1\033[7;31m')

# Check for Existing Backup
if [ -f "/storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz" ]
    then
        echo ${WARN}"An existing backup from today was found on this device."${CLR};sleep 0.25s;
        while true; do
            echo ${USER}"How would you like to proceed?"${CLR};
            echo ${OPT}"1 - Delete existing backup and perform a new backup."${CLR};
            echo ${OPT}"2 - Backup existin backup and perform a new backup."${CLR};
            echo ${OPT}"3 - Abort backup script."${CLR};
            read -p ${USER}"Make a selection:"${CLR} exist_backup
            case $exist_backup in
                1) echo ${INFO}"Deleting existing backup."${CLR};sleep 0.25s;
                   rm -rf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz;
                   echo ${INFO}"Performing new backup."${CLR};sleep 0.25s;
                   tar -zcf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr;
                   echo ${INFO}"Backup completed successfully."${CLR};sleep 0.25s;
                2) echo ${INFO}"Backing up existing backup."${CLR};sleep 0.25s;
                   if [ -d "/storage/emulated/0/termux/backups/backup-backups/" ]
                       then
                           mv --backup=t /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz /storage/emulated/0/termux/backups/backup-backups/;
                           echo ${INFO}"Performing new backup."${CLR};sleep 0.25s;
                           tar -zcf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr;
                           echo ${INFO}"Backup completed successfully."${CLR};sleep 0.25s;
                       else
                           mkdir /storage/emulated/0/termux/backups/backup-backups/;
                           mv --backup=t /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz /storage/emulated/0/termux/backups/backup-backups/;
                           echo ${INFO}"Performing new backup."${CLR};sleep 0.25s;
                           tar -zcf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr;
                           echo ${INFO}"Backup completed successfully."${CLR};sleep 0.25s;
                   fi
                3) echo ${WARN}"Aborting backup script."${CLR};sleep 0.25s;
                   exit
            esac
        done
    else
        echo ${INFO}"Performing Termux backup."${CLR};sleep 0.25s;
        tar -zcf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr;
        echo ${INFO}"Backup completed successfully."${CLR};sleep 0.25s;
fi

# Exit Message
echo ${WARN}"Although not required, it is strongly suggested to restart Termux before continuing."${CLR};sleep 0.25s;
exit
