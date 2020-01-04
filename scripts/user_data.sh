#! /bin/bash

yum install git -y
yum install httpd -y
service httpd start
chkconfig httpd on
cd /home/ec2-user
git clone https://github.com/suresh-devops/static_website.git
cp -R static_website/* /var/www/html
