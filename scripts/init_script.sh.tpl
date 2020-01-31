#!/bin/bash

cd /home/ubuntu/appjs
sudo npm install
sudo chown -R 1000:1000 "/home/ubuntu/.npm"
export DB_HOST=mongodb://${db-ip}:27017/posts
node seeds/seed.js
node app.js
