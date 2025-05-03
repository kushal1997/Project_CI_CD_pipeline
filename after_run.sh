#!/bin/bash

sudo apt install nginx

sudo systemctl stop nginx

#[ ! -f index.html ] && sudo touch index.html

# [ -f index.html ] && echo " =========== index file is there=========="
# [ ! -f index.html ] && echo " =========== index file is not there=========="

# count=$(ls /var/www/html/ | grep -i 'index.html' | wc -l)

#if [ $count -eq 0 ]; then
#	sudo touch  /var/www/html/index.html
#fi

sudo cp index.html /var/www/html/

[ ! -d /etc/nginx/sites-available/default_backup ] && sudo mkdir /etc/nginx/sites-available/default_backup

timestamp=$(date +"%Y-%m-%d_%H-%M")

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default_backup/default_${timestamp}.old

sudo cp sample_default_nginix_config /etc/nginx/sites-available/default

sudo nginx -t

sudo systemctl reload nginx

sudo systemctl restart nginx

sudo systemctl status nginx


echo "================ NGINX successfully updated open it using your ip address ==================="

ip a | grep inet | grep eth0 | awk '{print $2}' | cut -d/ -f1
 
