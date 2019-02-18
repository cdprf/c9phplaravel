#!/bin/bash
    sudo apt install apt-transport-https lsb-release software-properties-common git apache2 mysql-server phpmyadmin unzip &&
    sudo wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg &&
    sudo sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' &&
    sudo apt update -y &&
    sudo apt install -y php7.3 php7.3-common php7.3-cli php7.3-fpm php7.3-mysql php7.3-pgsql php7.3-mbstring libapache2-mod-php7.3 &&
    sudo apt install php7.3-bcmath php7.3-bz2 php7.3-curl php7.3-gd php7.3-intl php7.3-json php7.3-readline php7.3-xml php7.3-zip  &&
    sudo a2enmod php7.3 &&
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&
    php composer-setup.php &&
    php -r "unlink('composer-setup.php');"  &&
    sudo mv composer.phar /usr/local/bin/composer &&
    composer global require "laravel/installer" &&
    cd /var/www/html
    sudo composer create-project --prefer-dist laravel/laravel app
