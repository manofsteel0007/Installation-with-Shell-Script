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
        sudo apt-get install software-properties-common
        sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
        sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.3/ubuntu xenial main'
        sudo apt-get update
        sudo apt-get install mariadb-server-10.3
        sudo apt-get install libmysqlclient-dev
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/MariaDB/my.cnf?token=AP6NT4UOBQNINTRY2ZTO343A5FAGM -O /etc/mysql/my.cnf
        sudo service mysql restart
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
        echo UFW installation completed
    elif [ $var = "f" ]
    then 
        sudo mkdir /opt/wiki-js
        sudo wget https://github.com/Requarks/wiki/releases/download/2.5.201/wiki-js.tar.gz -O /opt/wiki-js/wiki-js.tar.gz
        sudo tar xzf /opt/wiki-js/wiki-js.tar.gz -C /opt/wiki-js/
        sudo rm /opt/wiki-js/wiki-js.tar.gz
        sudo mv /opt/wiki-js/config.sample.yml /opt/wiki-js/config.yml
    fi
done

echo All installation completed