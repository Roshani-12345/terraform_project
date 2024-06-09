#!/bin/bash
sudo yum install wget unzip httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
wget https://www.free-css.com/assets/files/free-css-templates/download/page296/healet.zip
unzip -o healet.zip
sudo cp -r healet-html/* /var/www/html/
sudo systemctl restart httpd

