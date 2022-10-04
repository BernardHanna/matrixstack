echo "${YELLOW}Updating .env (credentials for database and plugins)...${TXTRESET}"
sed -i -e "s/database_name/${PROJECTNAME}/g" .env
sed -i -e "s/database_user/root/g" .env
sed -i -e "s/database_password/${MYSQL_ROOT_PASSWORD_ENV}/g" .env
sed -i -e "s/database_host/localhost/g" .env
sed -i -e "s/example.com/${PROJECTNAME}.test/g" .env
sed -i -e "s/example.com/${PROJECTNAME}.test/g" .env
sed -i -e "s/http/https/g" .env
echo 'ACF_PRO_KEY=b3JkZXJfaWQ9NjIzMjB8dHlwZT1kZXZlbG9wZXJ8ZGF0ZT0yMDE1LTA4LTIwIDE0OjEyOjU4' >> .env
