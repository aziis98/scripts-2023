#!/bin/bash

# [Script] @Link ~/.local/bin/status

# Collect information
PACMAN=`pacman -Qu | wc -l`

#Time of day
HOUR=$(date +"%H")
if [ $HOUR -lt 12  -a $HOUR -ge 0 ]
then TIME="morning"
elif [ $HOUR -lt 17 -a $HOUR -ge 12 ]
then TIME="afternoon"
else TIME="evening"
fi

#System uptime
uptime=`cat /proc/uptime | cut -f1 -d.`
upDays=$((uptime/60/60/24))
upHours=$((uptime/60/60%24))
upMins=$((uptime/60%60))
upSecs=$((uptime%60))


#Color variables
K="\033[00;30m"
B="\033[00;36m"
P="\033[00;35m"
PB="\033[01;35m"

echo -e "$P========================================================================="
echo -e "$PB`figlet -f small $(uname -n) | sed 's/^/      /'`"
echo -e "$P========================================================================="
echo -e "  $K Hi $B$USER$K, $PACMAN packages can be updated"
echo -e "$P========================================================================="
echo -e "  $B CPU Temperature $K= `acpi -t | cut -f4 -d' '` C"
echo -e "  $B System Uptime $K= $upDays days $upHours hours $upMins minutes $upSecs seconds"
echo -e "$P========================================================================="
echo -e "$K`CLICOLOR_FORCE=1 COLORTERM="truecolor" duf -only local | sed 's/^/  /'`"
echo -e "$P========================================================================="
echo -e "$K"
