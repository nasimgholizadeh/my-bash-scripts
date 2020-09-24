#!/bin/bash
clear
read -p "Enter hour: " hour
read -p "Enter minute: " minute
read -p "Enter URL: " url
read -p "Auto shutdown when download complete? (y/n) " shutdown
system_hour=`date +%H`
system_minute=`date +%M`
system_date=$((system_hour * 60 + system_minute))
date_input=$((hour * 60 + minute))
while [ "$system_date" != "$date_input" ];do
        sleep 20
	system_hour=`date +%H`
        system_minute=`date +%M`
        system_date=$((system_hour * 60 + system_minute))
done
wget "$url"
a="$?"
if [ "$a" == "0" ];then
        notify-send "Download Complete!"
	if [ "$shutdown" == "y" ];then
		notify-send "The system will shutdown after 5sec..."
		sleep 5
		shutdown now
	fi
else
	case "$a" in
		"1")
			notify-send "Generic error code!"
			;;
		"2")
			notify-send "Parse error!"
			;;
		"3")
			notify-send "File I/O error!"
			;;
		"4")
			notify-send "Network failure!"
			;;
		"5")
			notify-send "SSL verification failure!"
			;;
		"6")
			notify-send "Username/password authentication failure!"
			;;
		"7")
			notify-send "Protocol errors!"
			;;
		"8")
			notify-send "Server issued an error response!"
			;;
		*)
			notify-send "Unexpected error!"
	esac
fi
