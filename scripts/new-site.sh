#!/bin/bash

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

user=`whoami`
name=$1
root="/home/$user/projects/sites/$name"

echo -e "${BLUE}Starting to create new Drupal website for ${ORANGE}$1${NOCOLOR}\n"

echo -e "  ${CYAN}- Checking if $root exists...${NOCOLOR}\n"

if [ -d "$root" ]
then
    echo -e "  ${YELLOW}- Directory already exists. Exiting.${NOCOLOR}\n"
    exit 0
fi

echo -e "  ${CYAN}- Cloning the repository...${NOCOLOR}\n"
git clone git@github.com:aspiringweb/skeleton.git $root

echo -e "  ${CYAN}- Updating .lando.yml file...${NOCOLOR}\n"
cd $root
sed -i "s/skeleton/$name/" .lando.yml

echo -e "  ${CYAN}- Starting Lando...${NOCOLOR}\n"
lando start

echo -e "  ${CYAN}- Installing Composer...${NOCOLOR}\n"
lando composer install

echo -e "  ${CYAN}- Installing Drupal...${NOCOLOR}\n"
lando drush si --account-name=admin --account-mail=matthew@mrconnerton.com --account-pass=admin --config-dir=config

echo -e "  ${CYAN}- Ready to log in...${NOCOLOR}\n"
lando drush uli --no-browser
