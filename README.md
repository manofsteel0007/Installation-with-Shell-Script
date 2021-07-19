# Script Usage Guide

**Download the script**

    sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/main.sh?token=AP6NT4V5WKQ4HRL57LBXTSLA5ZYRW -O ./main.sh
    sudo chmod +x main.sh
    sudo ./main.sh #(add letter corresponding to the software you want with spacing) 

**Postgresql - a**

    sudo service postgresql status

returns active 

**MariaDB - b**

MariaDB will be installed   

**Python3 - c**

Python3 will be installed   

**Node version manager & Node.js - d**

NVM and Node.js will be installed   

**UFW - e**

UFW will be installed, for more UFW related info visit https://www.tecmint.com/setup-ufw-firewall-on-ubuntu-and-debian/

**Wiki.js - f**

Wiki.js will be installed

    sudo systemctl status wiki

**PHP - g**

PHP will be installed   

**BookStackApp - h**

BookStackApp will be installed   

**Maddy-Server - i**

Maddy-Server will be installed   

    sudo systemctl status maddy

**Code-Server - j**

Code-Server will be installed  

    sudo systemctl status code-server

Code-Server runs at 8080 and the password is "password"

the password can be changed inside this editor

    sudo nano /lib/systemd/system/code-server.service

**Wordpress - k**

Script is made with an assumption that mysql password is 'root'. if it is defferent means change the script 

for example : "sudo mysql -u root -iproot" changes "sudo mysql -u root -ip'PASSWORD'" 

Wordpress will be installed

Wordpress runs at http://'ip-address'/wordpress

**PhpMyAdmin - l**

PhpMyAdmin will be installed

PhpMyAdmin runs at http://'ip-address'/phpmyadmin