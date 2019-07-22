#!/bin/bash

# DANGER: THIS SCRIPT WILL REMOVE THE DOCKER CONTAINERS AND THEN ADD BACK A NEW ONE

# SETUP VARIABLES
# USERS SHOULD CHANGE THESE!
SQLUSER=root
SQLROOTPW=rootPassword
VITRODBUSER=vitrodbUsername
VITRODBPW=vitrodbPassword

# CREATE TMP FOR VIVO DOCKER SETUP
if [ ! -d "/tmp/vds/" ]
then
	mkdir /tmp/vds/
else 
	rm -rf /tmp/vds/
	mkdir /tmp/vds/
fi

# MARIADB
mkdir /tmp/vds/db/
# CREATE THE MYSQL-INIT.SQL FILE
echo "CREATE DATABASE vitrodb CHARACTER SET utf8;" >> /tmp/vds/db/mysql-init.sql
echo "GRANT ALL ON vitrodb.* TO '$VITRODBUSER'@'%' IDENTIFIED BY '$VITRODBPW';" >> /tmp/vds/db/mysql-init.sql
docker stop vitrodb2
docker rm vitrodb2
docker run --name vitrodb2 -p 3306:3306 -v /tmp/vds/db:/docker-entrypoint-initdb.d -e MYSQL_USER=$SQLUSER -e MYSQL_ROOT_PASSWORD=$SQLROOTPW -d mariadb:latest

# SOLR
cd /tmp/vds/
git clone https://github.com/vivo-community/vivo-solr.git -b master
docker stop vivosolr2
docker rm vivosolr2
docker run --name vivosolr2 -d -p 8983:8983 -v /tmp/vds/vivo-solr/vivocore:/vivocore solr solr-create -c vivocore -d /vivocore
