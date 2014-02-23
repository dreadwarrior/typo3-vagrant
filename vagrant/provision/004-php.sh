#!/usr/bin/env bash

echo "Installing PHP..."

apt-get -y -qq install php5-fpm php5 php5-cli php5-curl php5-gd php5-json php5-mcrypt php5-mysql php5-sqlite php5-suhosin php5-xdebug php5-xsl

#echo "# Added by vagrant provisioning" >> /etc/php5/fpm/conf.d/xdebug.ini
#echo "xdebug.max_nesting_level=500" >> /etc/php5/fpm/conf.d/xdebug.ini
#echo "xdebug.remote_enable=1" >> /etc/php5/fpm/conf.d/xdebug.ini
#echo "xdebug.remote_connect_back=1" >> /etc/php5/fpm/conf.d/xdebug.ini

service php5-fpm restart
service nginx restart
