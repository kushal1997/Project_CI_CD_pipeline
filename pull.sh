

git pull origin

cp index.html /var/www/html/index.html

sudo apt install nginx

sudo systemctl reload nginx

sudo systemctl restart nginx

sudo systemctl status nginx


echo "================ NGINX successfully updated open it using your ip address ==================="

ip a | grep inet | grep eth0 | awk '{print $2}' | cut -d/ -f1
