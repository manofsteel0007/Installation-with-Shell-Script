#!/bin/sh

# postgres

    sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
    sudo apt-get update
    sudo apt-get -y install postgresql

#  mariaDB

    sudo apt-get install software-properties-common
    sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
    sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.3/ubuntu xenial main'
    sudo apt-get update
    sudo apt-get install mariadb-server-10.3
    sudo apt-get install libmysqlclient-dev
    sudo wget LINK -O /etc/mysql/my.cnf
    sudo service mysql restart
    # wget https://mirror.kku.ac.th/mariadb/mariadb-10.5.11/bintar-linux-systemd-x86_64/mariadb-10.5.11-linux-systemd-x86_64.tar.gz

# python 

    sudo apt update
    sudo apt install software-properties-common
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt update
    sudo apt install python3.8

# node

    sudo apt install nodejs
    sudo apt install npm
    curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash –

# nvm

    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
    export NVM_DIR="$HOME/.nvm"  
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# phpmyadmin 

    sudo apt update
    sudo apt install phpmyadmin php-mbstring php-gettext

# maddy-server

    wget https://github.com/foxcpp/maddy/releases/download/v0.4.4/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
    sudo apt install zstd
    unzstd maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
    sudo rm maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
    tar -xvf maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar
    sudo rm maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar
    cd maddy-0.4.4+dcdf4a7-x86_64-linux-musl
    sudo mv ./maddyctl /usr/local/bin/
    sudo mv ./maddy /usr/local/bin/
    cd systemd
    sudo mv ./maddy.service /etc/systemd/system/
    sudo mv ./maddy@.service /etc/systemd/system/
    sudo systemctl daemon-reload
    sudo useradd -mrU -s /sbin/nologin -d /var/lib/maddy -c "maddy mail server" maddy

    tls certificate adding

# ufw

    sudo apt install ufw
    sudo ufw status verbose

# wiki.js

    wget https://github.com/Requarks/wiki/releases/download/2.5.201/wiki-js.tar.gz
    mkdir wiki
    tar xzf wiki-js.tar.gz -C ./wiki
    cd ./wiki
    mv config.sample.yml config.yml
    node server
    
    #service
    nano /etc/systemd/system/wiki.service

        # [Unit]
        # Description=Wiki.js
        # After=network.target

        # [Service]
        # Type=simple
        # ExecStart=/usr/bin/node server
        # Restart=always
        # # Consider creating a dedicated user for Wiki.js here:
        # User=nobody
        # Environment=NODE_ENV=production
        # WorkingDirectory=/var/wiki

        # [Install]
        # WantedBy=multi-user.target

    systemctl daemon-reload
    systemctl start wiki

# bookstackapp

    # Ensure you have read the above information about what this script does before executing these commands.

    # Download the script
    wget https://raw.githubusercontent.com/BookStackApp/devops/master/scripts/installation-ubuntu-20.04.sh

    # Make it executable
    chmod a+x installation-ubuntu-20.04.sh

    # Run the script with admin permissions
    sudo ./installation-ubuntu-20.04.sh

# php

    sudo apt install software-properties-common
    sudo add-apt-repository ppa:ondrej/php
    sudo apt install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql
    php -v

# wordpress

    sudo apt update
    sudo apt install wordpress php libapache2-mod-php mysql-server php-mysql