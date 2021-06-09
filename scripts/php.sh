#!/bin/bash

sudo add-apt-repository ppa:ondrej/php

sudp apt update

sudo apt install php7.3 php7.3-fpm php7.3-mysql php7.3-mbstring php7.3-mcrypt php7.3-xml php7.3-gd php7.3-curl php7.3-zip
sudo apt install php7.4 php7.4-fpm php7.4-mysql php7.4-mbstring php7.4-mcrypt php7.4-xml php7.4-gd php7.4-curl php7.4-zip
sudo apt install php8.0 php8.0-fpm php8.0-mysql php8.0-mbstring php8.0-mcrypt php8.0-xml php8.0-gd php8.0-curl php8.0-zip

sudo update-alternatives --set php /usr/bin/php7.4

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/local/bin/composer
sudo chmod +x /usr/local/bin/composer

echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc

composer global require drupal/coder dealerdirect/phpcodesniffer-composer-installer

# edit ~/.config/Code/User/settings.json
# /home/$USER/.config/composer/vendor/bin/phpcs
# wget https://github.com/box-project/box/releases/download/3.13.0/box.phar
# sudo mv box.phar /usr/local/bin/box && sudo chmod +x /usr/local/bin/box
