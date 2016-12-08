#!/bin/bash

yum install gd gd-devel gcc glibc glibc-common wget unzip -y

useradd -m nagios
passwd nagios

groupadd nagcmd
usermod -a -G nagcmd nagios
usermod -a -G nagcmd apache


wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.2.4.tar.gz

wget https://nagios-plugins.org/download/nagios-plugins-2.1.4.tar.gz


tar -zxvf nagios-4.2.4.tar.gz

cd nagios-4.2.4

./configure --prefix=/etc/nagios --with-command-group=nagcmd

make all

make install 

make install-init 

make install-commandmode 

make install-config 

make install-webconf 

make install-exfoliation 

make install-classicui

htpasswd -c /etc/nagios/etc/htpasswd.users nagiosadmin

cd ..

tar -zxvf nagios-plugins-2.1.4.tar.gz

cd nagios-plugins-2.1.4

./configure --prefix=/etc/nagios --with-nagios-user=nagios --with-nagios-group=nagios

make

make install

chkconfig nagios on

chkconfig httpd on

service nagios start

service httpd start

