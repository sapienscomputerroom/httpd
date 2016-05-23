#!/bin/bash

mkdir --parents /etc/httpd/srclib/	# for apr and apr-utils

yum install --assumeyes epel-release wget gcc gcc-c++

cd /tmp
wget http://mirror.hosting90.cz/apache//apr/apr-1.5.2.tar.gz 
wget http://mirror.hosting90.cz/apache//apr/apr-util-1.5.4.tar.gz 
wget https://github.com/GrahamDumpleton/mod_wsgi/archive/4.5.3.tar.gz

cd /tmp

### install apr-1.5.2.tar.gz

tar -zxf apr-1.5.2.tar.gz 
tar -zxf apr-util-1.5.4.tar.gz
rm -rf *.tar.gz

cd apr-1.5.2/
./configure --prefix=/etc/httpd/srclib/apr
make
make install

cd /tmp/apr-util-1.5.4/
./configure --prefix=/etc/httpd/srclib/apr-util --with-include-apr=/etc/httpd/srclib/apr/
make
make install
