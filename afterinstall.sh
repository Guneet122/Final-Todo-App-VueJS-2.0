#!/bin/bash
source /home/ec2-user/.bash_profile
cd /var/www/html/
npm -v
node -v
nvm -v
npm install
npm install pm2 -g
sudo amazon-linux-extras install nginx1
sudo systemctl start nginx
cd /etc/nginx/
sudo sed -i '38,55d' nginx.conf
cd conf.d/
sudo touch todo.conf
echo -e "server {\n listen 80 default_server;\n server_name _;\n\n # node api reverse proxy\n location / {\n  proxy_pass http://localhost:3000/;\n }\n}" >> todo.conf;
