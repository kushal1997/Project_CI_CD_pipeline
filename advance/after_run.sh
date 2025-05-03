#!/bin/bash

python -m venv venv

source venv/bin/activate

pip install -r requirements.txt

nohup python app.py &

sudo apt install nginx

#sudo systemctl stop nginx


[ ! -d /etc/nginx/sites-available/default_backup ] && sudo mkdir /etc/nginx/sites-available/default_backup

timestamp=$(date +"%Y-%m-%d_%H-%M")

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default_backup/default_${timestamp}.old

sudo cp sample_default_nginix_config /etc/nginx/sites-available/default

sudo systemctl reload nginx

sudo systemctl restart nginx

sudo systemctl status nginx



if sudo systemctl is-active --quiet nginx; then
	echo "================ NGINX successfully updated. Open it in your browser: ==================="

	IP=$(ip a | grep inet | grep eth0 | awk '{print $2}' | cut -d/ -f1)

	echo "http://$IP/"
else
	echo "================ ERROR: NGINX failed to start.======================"
	
	sudo nginx -t
fi
