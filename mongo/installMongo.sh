# Automation: Install MongoDB on Ubuntu

echo ""
echo -e "\e[1;33;1;4mUNINSTALLING MONGO\e[0m"
echo -e "\e[1;34mThe full documentation for installation and removal can be found at:\e[0m"
echo -e "\e[1;34m        https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/\e[0m"
echo ""
echo -e "\e[36mThis script requires 'sudo' privileges. Please enter your password:\e[0m"

wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
sudo apt-get update
sudo apt-get install -y mongodb-org
sudo systemctl start mongod
sudo systemctl enable mongod
sudo systemctl status mongod
