

git pull origin

sudo cp index.html /var/www/html/index.html

timestamp=$(date +"%Y-%m-%d_%H-%M")

sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default_${timestamp}.old

sudo cp sample_default_nginix_config /etc/nginx/sites-available/default

sudo apt install nginx

sudo systemctl reload nginx

sudo systemctl restart nginx

sudo systemctl status nginx


echo "================ NGINX successfully updated open it using your ip address ==================="

ip a | grep inet | grep eth0 | awk '{print $2}' | cut -d/ -f1
