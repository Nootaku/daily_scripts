# Automation: Uninstall MongoDB on Ubuntu

echo -e "\e[1;33;1;4mUNINSTALLING MONGO\e[0m"
echo -e "\e[36mThis script requires 'sudo' privileges. Please enter your password:\e[0m"
sudo service mongod stop || sudo systemctl stop mongod
sudo apt-get purge mongodb-org*
sudo rm -r /var/log/mongodb
