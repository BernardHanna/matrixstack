echo "${YELLOW}Creating a MySQL database for ${PROJECTNAME}${TXTRESET}"
sudo mysql -u root -p ${MYSQL_ROOT_PASSWORD_ENV} -e "CREATE DATABASE ${PROJECTNAME}"
echo "${BOLDGREEN}Attempt to create MySQL database successful.${TXTRESET}"
