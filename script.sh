#! /bin/bash

sudo yum update -y
sudo yum install -y httpd
sudo systemctl enable httpd
sudo service httpd start
sudo echo "<h1>Welcome to kaobi Website from $HOSTNAME</h1>" > /var/www/html/index.html'
sudo mkdir /var/www/html/app1
sudo echo "<!DOCTYPE html> <html> <body style=\"background-color:rgb(250, 210, 210);\"> <h1>Welcome to kaobi Website from $HOSTNAME!</h1> <p>Ec2 Demo</p> <p>Application Version: V1</p> </body></html>" > /var/www/html/app1/index.html'

