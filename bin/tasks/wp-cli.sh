echo "${YELLOW}Installing WordPress...${TXTRESET}"
echo "path: wp
url: https://${PROJECTNAME}.test

core install:
  admin_user: \"${WP_ADMIN_USER}\"
  admin_password: \"${WP_ADMIN_USER_PASSWORD}\"
  admin_email: \"${WP_ADMIN_USER_EMAIL}\"
  title: \"${PROJECTNAME}\"" > wp-cli.yml

# Actual install command
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp core install --title=${PROJECTNAME} --admin_email=${WP_ADMIN_USER_EMAIL}

# Update settings
echo "${YELLOW}Removing default WordPress posts and applying settings via WP-CLI...${TXTRESET}"
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp post delete 1 --force
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp post delete 2 --force
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update blogdescription ''
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update WPLANG 'en_GB'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update current_theme '$PROJECTNAME'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp theme delete twentytwelve
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp theme delete twentythirteen
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update permalink_structure '/%postname%'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update timezone_string 'Europe/Dublin'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update default_pingback_flag '0'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update default_ping_status 'closed'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update default_comment_status 'closed'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update date_format 'j.n.Y'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update time_format 'H.i'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option update admin_email 'bernard@matrixinternet.ie'
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp option delete new_admin_email
cd ${PROJECTS_HOME}/$PROJECTNAME/;vendor/wp-cli/wp-cli/bin/wp plugin activate --all
