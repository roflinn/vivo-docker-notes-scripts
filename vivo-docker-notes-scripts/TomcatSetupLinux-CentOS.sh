#!/bin/bash

# ------------------------------------------------------------------------------
# Pre-requisites
# A machine with CentOS 7.0 installed.
# A root (su) user on the machine.
# Instructions Originally from:
#      https://linuxize.com/post/how-to-install-tomcat-9-on-centos-7/
#      https://www.rosehosting.com/blog/install-tomcat-9-on-centos-7/
#      https://www.linuxtechi.com/install-apache-tomcat9-centos7-rhel7-ubuntu16-04/
# Compiled By: Ralph O'Flinn

# Tomcat Download Location: http://www-eu.apache.org/dist/tomcat/tomcat-9/

TOMCATVER=9.0.21

cd /tmp
wget https://www-eu.apache.org/dist/tomcat/tomcat-9/v$TOMCATVER/bin/apache-tomcat-$TOMCATVER.tar.gz

tar -zxpvf apache-tomcat-$TOMCATVER.tar.gz -C /opt/
ln -s apache-tomcat-$TOMCATVER tomcat

echo "export CATALINA_HOME='/opt/tomcat/'" >> ~/.bashrc
source ~/.bashrc

useradd -r tomcat --shell /bin/false
chown -R tomcat:tomcat /opt/tomcat/

echo "[Unit]" >> /etc/systemd/system/tomcat.service
echo "Description=Apache Tomcat 9" >> /etc/systemd/system/tomcat.service
echo "After=syslog.target network.target" >> /etc/systemd/system/tomcat.service
echo "" >> /etc/systemd/system/tomcat.service
echo "[Service]" >> /etc/systemd/system/tomcat.service
echo "User=tomcat" >> /etc/systemd/system/tomcat.service
echo "Group=tomcat" >> /etc/systemd/system/tomcat.service
echo "Type=forking" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_PID=/opt/tomcat/tomcat.pid" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_HOME=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "Environment=CATALINA_BASE=/opt/tomcat" >> /etc/systemd/system/tomcat.service
echo "ExecStart=/opt/tomcat/bin/startup.sh" >> /etc/systemd/system/tomcat.service
echo "ExecStop=/opt/tomcat/bin/shutdown.sh" >> /etc/systemd/system/tomcat.service
echo "Restart=on-failure" >> /etc/systemd/system/tomcat.service
echo "" >> /etc/systemd/system/tomcat.service
echo "[Install] " >> /etc/systemd/system/tomcat.service
echo "WantedBy=multi-user.target" >> /etc/systemd/system/tomcat.service

sudo systemctl daemon-reload
sudo systemctl enable tomcat
sudo systemctl start tomcat
sudo systemctl status tomcat

# Adjust the Firewall
sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp
sudo firewall-cmd --reload