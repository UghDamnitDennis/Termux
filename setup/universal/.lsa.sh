#!/bin/bash

# Constant Variables
BigSep="==========================================================================================================================="
LilSep="---------------------------------------------------------------------------------------------------------------------------"

# Dynamic Variables
lsTWidth=$(ls -lAgGhop1 $PWD --group-directories-first --author --file-type --time-style=+%m/%d/%Y", "%H:%M:%S --color=always | sed -n '1!p' | column -t -o ' | ' -N 'P','L','O','Size:','-Mod__Date-','Mod_Time','Name:' --table-order 1,2,3,7,4,5,6 -H 1,2,3 | sed -e 's/^/| /' -e 's/$/ |/' | sed -e 's/ | / /3' | sed -e 's/-Mod__Date- Mod_Time/  Last Modified On: /' | awk '{ print length }' | head -n 1)
lsF1Width=$(ls -lAgGhop1 $PWD --group-directories-first --author --file-type --time-style=+%m/%d/%Y", "%H:%M:%S --color=always | sed -n '1!p' | column -t -o ' | ' -N 'P','L','O','Size:','-Mod__Date-','Mod_Time','Name:' --table-order 1,2,3,7,4,5,6 -H 1,2,3 | sed -e 's/^/| /' -e 's/$/ |/' | sed -e 's/ | / /3' | sed -e 's/-Mod__Date- Mod_Time/  Last Modified On: /' | cut -d '|' -f2 | awk '{ print length }' | head -n 1)
lsF2Width=$(ls -lAgGhop1 $PWD --group-directories-first --author --file-type --time-style=+%m/%d/%Y", "%H:%M:%S --color=always | sed -n '1!p' | column -t -o ' | ' -N 'P','L','O','Size:','-Mod__Date-','Mod_Time','Name:' --table-order 1,2,3,7,4,5,6 -H 1,2,3 | sed -e 's/^/| /' -e 's/$/ |/' | sed -e 's/ | / /3' | sed -e 's/-Mod__Date- Mod_Time/  Last Modified On: /' | cut -d '|' -f3 | awk '{ print length }' | head -n 1)
lsF3Width=$(ls -lAgGhop1 $PWD --group-directories-first --author --file-type --time-style=+%m/%d/%Y", "%H:%M:%S --color=always | sed -n '1!p' | column -t -o ' | ' -N 'P','L','O','Size:','-Mod__Date-','Mod_Time','Name:' --table-order 1,2,3,7,4,5,6 -H 1,2,3 | sed -e 's/^/| /' -e 's/$/ |/' | sed -e 's/ | / /3' | sed -e 's/-Mod__Date- Mod_Time/  Last Modified On: /' | cut -d '|' -f4 | awk '{ print length }' | head -n 1)
HdrSep=$(echo "+"`printf '%*s' $lsF1Width | tr ' ' $LilSep`"+"`printf '%*s' $lsF2Width | tr ' ' $LilSep`"+"`printf '%*s' $lsF3Width | tr ' ' $LilSep`"+")

# Clear Screen
clear;

# lsa $PWD
echo "$(echo "$(echo $(printf '%*s' $lsTWidth | tr ' ' $BigSep | sed -e 's/^./\//' -e 's/.$/\\/');ls -lAgGhop1 $PWD --group-directories-first --author --file-type --time-style=+%m/%d/%Y", "%H:%M:%S --color=always | sed -n '1!p' | column -t -o ' | ' -N 'P','L','O','Size:','-Mod__Date-','Mod_Time','Name:' --table-order 1,2,3,7,4,5,6 -H 1,2,3 | sed -e 's/^/| /' -e 's/$/ |/' | sed -e 's/ | / /3' | sed -e 's/-Mod__Date- Mod_Time/  Last Modified On: /';echo $(printf '%*s' $lsTWidth | tr ' ' $BigSep | sed -e 's/^./\\/' -e 's/.$/\//'))" | sed "2 a `echo $HdrSep`")"