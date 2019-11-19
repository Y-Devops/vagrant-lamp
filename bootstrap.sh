export DEBIAN_FRONTEND=noninteractive

# Update Packages
apt-get update
# Upgrade Packages
apt-get upgrade

# Basic Linux Stuff
apt-get install -y git

# Apache
apt-get install -y apache2

# Enable Apache Mods
a2enmod rewrite

#Add Onrej PPA Repo
#apt-add-repository ppa:ondrej/php
#apt-get update

# Install PHP
apt-get install -y php7.2

# PHP Apache Mod
apt-get install -y libapache2-mod-php7.2

# Restart Apache
service apache2 restart

# PHP Mods
apt-get install -y php7.2-common
#apt-get install -y php7.2-mcrypt
apt-get install -y php7.2-zip

apt-get install -y php-pear php7.2-dev libmcrypt-dev gcc make autoconf libc-dev pkg-config
pecl -q install mcrypt-1.0.1
echo 'extension=mcrypt.so' | sudo tee -a /etc/php/7.2/mods-available/mcrypt.ini
ln -s /etc/php/7.2/mods-available/mcrypt.ini /etc/php/7.2/cli/conf.d/20-mcrypt.ini

# Set MySQL Pass
debconf-set-selections <<< 'mysql-server mysql-server/root_password password root'
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password root'

# Install MySQL
apt-get install -y mysql-server

# PHP-MYSQL lib
apt-get install -y php7.2-mysql

# Restart Apache
sudo service apache2 restart
