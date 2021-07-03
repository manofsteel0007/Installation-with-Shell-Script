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
        echo -e "export NVM_DIR=\"$HOME/.nvm\"\n \
        [ -s \"$NVM_DIR/nvm.sh\" ] && \. \"$NVM_DIR/nvm.sh\"\\n \
        [ -s \"$NVM_DIR/bash_completion\" ] && \. \"$NVM_DIR/bash_completion\" " >>/home/ubuntu/.bashrc 
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
        sudo apt install nodejs
        npm rebuild sqlite3
        sudo node /opt/wiki-js/server
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Wiki.js/wiki.service?token=AP6NT4XSFMTLXG3UVFUACATA5FKES -O /etc/systemd/system/wiki.service
    fi
done

echo All installation completed