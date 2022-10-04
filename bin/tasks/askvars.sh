# General vars
ENV_FILE="${HOME}/.env_createproject"

# Ask Credentials
echo ""
echo "${BOLDYELLOW}What is your MySQL password (asked only first time):${TXTRESET} "
read -e MYSQL_ROOT_PASSWORD
    
echo "${BOLDYELLOW}Enter the new database name ${TXTRESET}"
read dbname

echo "Creating new MySQL database..."
sudo mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE ${dbname} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
echo "Database successfully created!"

echo "${BOLDYELLOW}Enter database user${TXTRESET}"
read username

echo "${BOLDYELLOW}Enter the PASSWORD for database user! Note: Password will be hidden when typing${TXTRESET}"
read -s userpass
    
echo "Granting ALL privileges on ${dbname} to ${username}!"
sudo mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON ${dbname}.* TO '${username}'@'localhost';"
sudo mysql -uroot -p${MYSQL_ROOT_PASSWORD} -e "FLUSH PRIVILEGES;"
echo "Database is ready :)"

# Ask project name
echo "${BOLDYELLOW}Project name in lowercase (without spaces or special characters):${TXTRESET} "
read -e PROJECTNAME

echo ""
echo "${BOLDYELLOW}What is the admin user you want to login to wp-admin by default (asked only first time):${TXTRESET} "
read -e WP_ADMIN_USER

echo ""
echo "${BOLDYELLOW}What is the password you want to use with your wp-admin admin user by default (asked only first time):${TXTRESET} "
read -e WP_ADMIN_USER_PASSWORD

echo ""
echo "${BOLDYELLOW}What is the email address you want to use with your wp-admin admin user by default (asked only first time):${TXTRESET} "
read -e WP_ADMIN_USER_EMAIL

# Do we use GitHub settings or not
if grep -q "GITHUB_COMPANY_USERNAME" ${ENV_FILE}; then
  # If found
  echo ""
else
  # If not found
  echo ""
  read -p "${BOLDYELLOW}Do you want to use automatic GitHub organisation repositories for your projects? (y/n)${TXTRESET} " yngithub
    if [ "$yngithub" = "y" ]; then

      # GitHub username
      if grep -q "GITHUB_COMPANY_USERNAME" ${ENV_FILE}; then
        # If found
        echo ""
      else
        # If not found
        echo ""
        echo "${BOLDYELLOW}GitHub company username (this is used for repo url):${TXTRESET} "
        read -e GITHUB_COMPANY_USERNAME

        # Add Credentials to .env
        echo "GITHUB_COMPANY_USERNAME=${GITHUB_COMPANY_USERNAME}" >> ${ENV_FILE}
      fi

      # GitHub access token
      if grep -q "GITHUB_ACCESS_TOKEN" ${ENV_FILE}; then
        # If found
        echo ""
      else
        # If not found
        echo ""
        echo "${BOLDYELLOW}GitHub access token (Tutorial: https://help.github.com/articles/creating-a-personal-access-token-for-the-command-line/):${TXTRESET} "
        read -e GITHUB_ACCESS_TOKEN

        # Add Credentials to .env
        sudo echo "GITHUB_ACCESS_TOKEN=${GITHUB_ACCESS_TOKEN}" >> ${ENV_FILE}
      fi
    fi
fi


# Add Credentials to .env
sudo touch ${ENV_FILE}
