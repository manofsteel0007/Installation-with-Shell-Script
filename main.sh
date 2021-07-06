#!/bin/sh
for var in "$@"
do
    if [ $var = "a" ]
    then
        sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
        wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
        sudo apt-get update
        sudo apt-get -y install postgresql
        echo Postgres installation completed
    elif [ $var = "b" ]
    then
        curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
        sudo apt install mariadb-server
        echo MariaDB installation completed
    elif [ $var = "c" ]
    then
        sudo apt update
        sudo apt install python3.8
        sudo apt install -y python3-pip
        sudo apt install -y python3-venv
        echo python3 installation completed
    elif [ $var = "d"]
    then 
        wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash
        export NVM_DIR="$HOME/.nvm"  
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
        nvm install 12
        npm install -g yarn
        echo NVM, nodejs, yarn installation completed
    elif [ $var = "e" ]
    then 
        sudo apt install ufw
        sudo ufw status verbose
        sudo ufw enable
        sudo ufw allow ssh
        echo UFW installation completed
    elif [ $var = "f" ]
    then 
        sudo mkdir /opt/wiki-js
        sudo wget https://github.com/Requarks/wiki/releases/download/2.5.201/wiki-js.tar.gz -O /opt/wiki-js/wiki-js.tar.gz
        sudo tar xzf /opt/wiki-js/wiki-js.tar.gz -C /opt/wiki-js/
        sudo rm /opt/wiki-js/wiki-js.tar.gz
        sudo mv /opt/wiki-js/config.sample.yml /opt/wiki-js/config.yml
        sudo apt install nodejs
        npm rebuild sqlite3
        sudo node /opt/wiki-js/server
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Wiki.js/wiki.service?token=AP6NT4XSFMTLXG3UVFUACATA5FKES -O /etc/systemd/system/wiki.service
        echo Wiki-js installation completed
    elif [ $var = "g" ]
    then 
        sudo apt install software-properties-common
        sudo add-apt-repository ppa:ondrej/php
        sudo apt install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql
        echo PHP installation completed
    elif [ $var = "h" ]
    then 
        sudo wget https://raw.githubusercontent.com/BookStackApp/devops/master/scripts/installation-ubuntu-20.04.sh -O /opt/installation-ubuntu-20.04.sh
        sudo chmod a+x /opt/installation-ubuntu-20.04.sh
        sudo bash /opt/installation-ubuntu-20.04.sh
        echo BookStackApp installation completed
    elif [ $var = "i" ]
    then 
        sudo mkdir /opt/maddy/ 
        sudo wget https://github.com/foxcpp/maddy/releases/download/v0.4.4/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst -O /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
        sudo apt install zstd
        sudo unzstd /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
        sudo tar -xvf /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar -C /opt/maddy/
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy.conf 
        sudo wget LINK -O /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy.conf
        sudo mkdir /etc/maddy/
        sudo mkdir /etc/maddy/certs/
        sudo hostnamectl set-hostname ubunut.localhost
        openssl req -new -x509 -days 365 -nodes \
        -out /etc/maddy/certs/fullchain.pem \
        -keyout /etc/maddy/certs/private.pem \
        -subj "/C=IN/ST=TamilNadu/L=India/O=IT/CN= ubuntu@localhost"

        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddyctl /usr/local/bin/
        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy /usr/local/bin/
        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/systemd/maddy.service /etc/systemd/system/
        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/systemd/maddy@.service /etc/systemd/system/
        
        sudo useradd -mrU -s /sbin/nologin -d /var/lib/maddy -c "maddy mail server" maddy

        sudo systemctl daemon-reload
        sudo systemctl start maddy
        echo Maddy-Server installation completed
    fi
done

echo All installation completed