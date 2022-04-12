#!/bin/bash
source /home/ec2-user/.bash_profile
cd /var/www/html/
npm -v
node -v
nvm -v
npm install
npm install pm2 -g
