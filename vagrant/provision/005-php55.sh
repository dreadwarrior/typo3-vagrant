#!/usr/bin/env bash

echo "Updating PHP to version 5.5..."

# http://phpave.com/upgrade-php-5-3-php-5-5-ubuntu-12-04-lts/#.Uwn11cPUK1E
apt-get -y -qq install python-software-properties
add-apt-repository -y ppa:ondrej/php5
apt-get -y -qq update && apt-get -y -qq dist-upgrade

# additional xdebug settings
ln -s /vagrant/vagrant/config/php5-fpm/conf.d/xdebug_typo3.ini /etc/php5/fpm/conf.d/21-xdebug_typo3.ini

# removal. of default pool
mv /etc/php5/fpm/pool.d/www.conf /etc/php5/fpm/pool.d/www.conf.bak
# adding our own pool
ln -s /vagrant/vagrant/config/php5-fpm/pool.d/www_typo3.conf /etc/php5/fpm/pool.d/www_typo3.conf

service php5-fpm restart
service nginx restart