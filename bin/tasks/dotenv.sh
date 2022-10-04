echo "${YELLOW}Updating .env (credentials for database and plugins)...${TXTRESET}"
sed -i -e "s/database_name/${dbname}/g" .env
sed -i -e "s/database_user/${username}/g" .env
sed -i -e "s/database_password/${userpass}/g" .env
sed -i -e "s/database_host/127.0.0.1/g" .env
sed -i -e "s/example.com/${PROJECTNAME}.test/g" .env
sed -i -e "s/example.com/${PROJECTNAME}.test/g" .env
sed -i -e "s/http/https/g" .env

echo 'ACF_PRO_KEY=b3JkZXJfaWQ9NjIzMjB8dHlwZT1kZXZlbG9wZXJ8ZGF0ZT0yMDE1LTA4LTIwIDE0OjEyOjU4' >> .env