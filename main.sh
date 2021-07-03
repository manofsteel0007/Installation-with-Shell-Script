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
        sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
        sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.3/ubuntu xenial main'
        sudo apt-get update
        sudo apt-get install mariadb-server-10.3
        echo MariaDB installation completed
    elif [ $var = "c" ]
    then
        sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
        sudo add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ubuntu-tw.org/mirror/mariadb/repo/10.3/ubuntu xenial main'
        sudo apt-get update
        sudo apt-get install mariadb-server-10.3
        echo MariaDB installation completed
    fi
done

echo All installation completed