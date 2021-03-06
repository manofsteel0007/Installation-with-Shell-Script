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
        sudo apt -y install mariadb-server
        sudo mysql_secure_installation
        sudo systemctl restart mariadb
        # sudo rm /etc/mysql/mariadb.conf.d/50-server.cnf
        # sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/50-server.cnf?token=AP6NT4W3LFFINNPT7ZO6I5LA6BOAK -O /etc/mysql/mariadb.conf.d/50-server.cnf
        # sudo systemctl restart mariadb
        # echo "RENAME USER 'root'@'localhost' TO 'root'@'remote_server_ip';" | sudo mysql -u root -iproot
        # echo "CREATE USER 'root'@'remote_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';" | sudo mysql -u root -iproot
        # echo "GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'root'@'remote_server_ip' WITH GRANT OPTION;" | sudo mysql -u root -iproot
        # echo "FLUSH PRIVILEGES;" |sudo mysql -u root -iproot
        echo MariaDB installation completed
    elif [ $var = "c" ]
    then
        sudo apt update
        sudo apt install -y python3.8
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
        sudo apt -y install ufw
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
        sudo apt install -y nodejs
        npm rebuild sqlite3
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Wiki.js/wiki.service?token=AP6NT4XSFMTLXG3UVFUACATA5FKES -O /etc/systemd/system/wiki.service
        sudo systemctl daemon-reload
        sudo systemctl start wiki
        echo Wiki-js installation completed
    elif [ $var = "g" ]
    then 
        sudo apt -y install software-properties-common
        sudo add-apt-repository ppa:ondrej/php
        sudo apt -y install php7.3 php7.3-common php7.3-opcache php7.3-cli php7.3-gd php7.3-curl php7.3-mysql
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
        sudo apt -y install zstd
        sudo unzstd /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar.zst
        sudo tar -xvf /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar -C /opt/maddy/
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl.tar
        sudo rm /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy.conf 
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Maddy/maddy.conf?token=AP6NT4SU24XE5FOGD7XEXITA6LHGE -O /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy.conf
        sudo mkdir /etc/maddy/
        sudo mkdir /etc/maddy/certs/
        sudo hostnamectl set-hostname ubunut.localhost
        sudo openssl req -new -x509 -days 365 -nodes \
        -out /etc/maddy/certs/fullchain.pem \
        -keyout /etc/maddy/certs/private.pem \
        -subj "/C=IN/ST=TamilNadu/L=India/O=IT/CN= ubuntu.localhost"

        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddyctl /usr/local/bin/
        sudo mv /opt/maddy/maddy-0.4.4+dcdf4a7-x86_64-linux-musl/maddy /usr/local/bin/
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Maddy/maddy.service?token=AP6NT4W5Q3AI5PDNVFT2M7LA54EMO -O /etc/systemd/system/maddy.service
        sudo useradd -mrU -s /sbin/nologin -d /var/lib/maddy -c "maddy mail server" maddy

        sudo systemctl daemon-reload
        sudo systemctl start maddy
        echo Maddy-Server installation completed
    elif [ $var = "j" ]
    then 
        sudo apt update
        sudo apt -y install nginx
        sudo mkdir /opt/code-server/
        sudo wget https://github.com/cdr/code-server/releases/download/v3.3.1/code-server-3.3.1-linux-amd64.tar.gz -O /opt/code-server/code-server-3.3.1-linux-amd64.tar.gz
        sudo tar -xvf /opt/code-server/code-server-3.3.1-linux-amd64.tar.gz -C /opt/code-server/
        sudo rm /opt/code-server/code-server-3.3.1-linux-amd64.tar.gz
        sudo sudo cp -r /opt/code-server/code-server-3.3.1-linux-amd64 /usr/lib/code-server
        sudo ln -s /usr/lib/code-server/bin/code-server /usr/bin/code-server
        sudo mkdir /var/lib/code-server
        sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/Code-Server/code-server.service?token=AP6NT4TECXRNYXMWGMWJEDTA7RX6W -O /lib/systemd/system/code-server.service
        sudo systemctl start code-server
        sudo systemctl enable code-server
        # sudo ufw allow 8080/tcp

        # sudo wget "LINK" -O /etc/nginx/sites-available/code-server.conf
        # sudo ln -s /etc/nginx/sites-available/code-server.conf /etc/nginx/sites-enabled/code-server.conf

        # sudo apt install certbot python3-certbot-nginx
        # sudo ufw allow https
        # sudo ufw reload
        # sudo certbot --nginx -d code-server."your-domain"
        echo Code Server installation completed
    elif [ $var = "k" ]
    then 
        sudo apt -y update 
        sudo apt -y install apache2
        check=$(service mariadb status | grep "running" | wc -l)
        if [ $check == 0 ]
        then
            curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
            sudo apt -y install mariadb-server
            sudo mysql_secure_installation
            sudo systemctl restart mariadb
            # sudo rm /etc/mysql/mariadb.conf.d/50-server.cnf
            # sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/50-server.cnf?token=AP6NT4W3LFFINNPT7ZO6I5LA6BOAK -O /etc/mysql/mariadb.conf.d/50-server.cnf
            # sudo systemctl restart mariadb
            # echo "RENAME USER 'root'@'localhost' TO 'root'@'remote_server_ip';" | sudo mysql -u root -iproot
            # echo "CREATE USER 'root'@'remote_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';" | sudo mysql -u root -iproot
            # echo "GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'root'@'remote_server_ip' WITH GRANT OPTION;" | sudo mysql -u root -iproot
            # echo "FLUSH PRIVILEGES;" |sudo mysql -u root -iproot
        fi
        sudo apt install -y php 
        sudo wget https://wordpress.org/latest.tar.gz -O /opt/latest.tar.gz
        sudo tar -xvf /opt/latest.tar.gz -C /var/www/html/
        sudo apt -y install php-mysql php-cgi php-cli php-gd
        sudo systemctl restart apache2
        sudo chown -R www-data:www-data /var/www/

        echo "CREATE DATABASE wordpress;" | sudo mysql -u root -iproot
        echo "GRANT ALL ON wordpress.* TO wordpress@localhost IDENTIFIED BY 'password';" | sudo mysql -u root -iproot
        echo "FLUSH PRIVILEGES;" |sudo mysql -u root -iproot
        echo Wordpress installation completed
    elif [ $var = "l" ]
    then 
        sudo apt update
        check=$(service mariadb status | grep "running" | wc -l)
        if [ $check == 0 ]
        then
            curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
            sudo apt -y install mariadb-server
            sudo mysql_secure_installation
            sudo systemctl restart mariadb
            # sudo rm /etc/mysql/mariadb.conf.d/50-server.cnf
            # sudo wget https://raw.githubusercontent.com/manofsteel0007/Installation-with-Shell-Script/master/50-server.cnf?token=AP6NT4W3LFFINNPT7ZO6I5LA6BOAK -O /etc/mysql/mariadb.conf.d/50-server.cnf            
            # sudo systemctl restart mariadb
            # echo "RENAME USER 'root'@'localhost' TO 'root'@'remote_server_ip';" | sudo mysql -u root -iproot
            # echo "CREATE USER 'root'@'remote_server_ip' IDENTIFIED WITH mysql_native_password BY 'password';" | sudo mysql -u root -iproot
            # echo "GRANT CREATE, ALTER, DROP, INSERT, UPDATE, DELETE, SELECT, REFERENCES, RELOAD on *.* TO 'root'@'remote_server_ip' WITH GRANT OPTION;" | sudo mysql -u root -iproot
            # echo "FLUSH PRIVILEGES;" |sudo mysql -u root -iproot
        fi
        sudo apt install phpmyadmin 
        sudo ln -s /usr/share/phpmyadmin /var/www/html
        sudo systemctl restart apache2
        echo PhpMyAdmin installation completed
    fi
done

echo All installation completed