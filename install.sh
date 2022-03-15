!#/bin/bash
##	Tuesday, March 15, 2022
##	Script to install Nodejs, Nginx
##	Once successful the script creates a React app and launches it on the Nginx document root
##

####### UPDATE THE ENVIRONMENT
sudo apt-get update -y
echo "Environment Updated Successfully"

###### INSTALL CURL TOOL
sudo apt-get install curl -y
echo "Successfully installed \'curl\'"

#install nodejs ubuntu
sudo apt-get install curl
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

###### INSTALL AND START NGINX
sudo apt-get install nginx -y
echo "Nginx Installed Successfully!"

sudo systemctl start nginx
echo "Nginx server started successfully!"

#clone the frontend react app
cd /var/www/html
sudo git clone https://github.com/President-Banda/Mobalysis.git
cd Mobalysis/frontend
sudo npm install
sudo npm run build

#Copy the frontend build to the nginx server
sudo cp -r /var/www/html/Mobalysis/frontend/build/* /var/www/html/
sudo -rf index.nginx.debian.html
echo "App Started Successfully!"
