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

###### INSTALL NVM [Node Vesion Manager] 
# Or Install Node source
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
nvm install 14.4.0
echo "Successfully Installed NVM and Nodejs"

# Or Use Node Source
# curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
# sudo apt-get install -y nodejs
# echo "Successfully Installed Nodejs"

###### INSTALL AND START NGINX
sudo apt-get install nginx -y
echo "Nginx Installed Successfully!"

sudo systemctl start nginx
echo "Nginx server started successfully!"

###### CHANGE HTML DIRECTORY PERMISSIONS
chown -R ubuntu /var/www/html
chown -R 755 /var/www/html
echo "Permissions Set Successfully"

###### CHANGE INTO /VAR/WWW/HTML
cd /var/ww/html/
echo "Changed Into /var/ww/html"

###### CREATE THE REACT APP
npx create-react-app react-sample
echo "Created New/Sample React App Successfully!"

###### START THE APP
cd react-sample
npm start
echo "App Started Successfully on Port 3000!"
