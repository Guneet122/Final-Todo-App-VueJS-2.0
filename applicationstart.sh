#!/bin/bash

cd /var/www/html/
pm2 start ecosystem.config.js
systemctl restart nginx