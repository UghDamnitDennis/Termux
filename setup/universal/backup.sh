#!/bin/bash

# Backup Termux
[ -f "/storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz" ] && mkdir /storage/emulated/0/termux/backup_duplicates/;mv /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz /storage/emulated/0/termux/backup_duplicates/;echo -ne "\033[1m\033[4;30;43mAn existing backup for $(date +%m/%d/%Y) was found. It has been moved to 'storage/emulated/0/termux/backup_duplicates'.\033[0m\n" || echo -ne "\033[3m\033[4;33mPerforming Termux backup.\033[0m\n"
echo -ne "\033[31m>>>>>>>>>>>>>                           [33%]\033[0m\r"
sleep 3
echo -ne "\033[31m>>>>>>>>>>>>>>>>>>>>>>>>>>              [66%]\033[0m\r"
tar -zcf /storage/emulated/0/termux/backups/$(date +%m/%d/%Y)_termux-backup.tar.gz -C /data/data/com.termux/files ./home ./usr
echo -ne "\033[32m>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>[100%]\033[0m\n"
sleep 1
echo -ne "\033[1m\033[4;32mBackup completed successfully.\033[0m\n\033[1m\033[4;30;43mAlthought not required, it is recommended to restart Termux before continuing...\033[0m\n"
exit
