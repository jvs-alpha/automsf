# automsf
automation of msfpayload for android

# requirements
1) kali linux or ubuntu with metasploit
2) metasploit
3) apache2 server

# basics
the metaspoit framework is used to make payloads and exploits for many devices 
so i have writen a script that will make a .apk file when you install it on a victim's phone
it will create a reverse shell to your computer

# automsf.sh
this one will just create a .apk file with and the handler 

# automsf2.sh
this one will create a .apk file and it copy the file to the website 
so you can make some one to download the .apk
run setup.sh for installing apache server

# automsf3.sh
this one is similar to the second one but the main difference is that this 
shellscript will make you able to hack a phone outside you network
for that you need to do somethings

they are 
1) open a port 4444 with tcp protocol
2) set it to the computer your going to hack with

these are the requirments for to hack a android phone outside the network
