#!/bin/bash
sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
ssudo systemctl enable httpd
echo "<h1>Welcome to ec2</h1>">/var/www/html/index.html