#!/bin/bash

cd /home/ubuntu/appjs
sudo chown -R 1000:1000 "/home/ubuntu/.npm"
sudo npm install
sudo npm start
exit
