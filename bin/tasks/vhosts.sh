echo "<VirtualHost *:80>
    ServerAdmin bernard@matrixinternet.ie
    DocumentRoot $PROJECTS_HOME/$PROJECTNAME
    ServerName $PROJECTNAME.test
    ServerAlias www.$PROJECTNAME.test

	ErrorLog ${APACHE_LOG_DIR}/error.log
	CustomLog ${APACHE_LOG_DIR}/access.log combined

    <Directory $PROJECTS_HOME/$PROJECTNAME>
        Require all granted
        AllowOverride All
  </Directory>
</VirtualHost>
<VirtualHost *:443>
		ServerAdmin bernard@matrixinternet.ie
		DocumentRoot $PROJECTS_HOME/$PROJECTNAME
		ServerName $PROJECTNAME.test
		ServerAlias www.$PROJECTNAME.test
		
		ErrorLog ${APACHE_LOG_DIR}/error.log
		CustomLog ${APACHE_LOG_DIR}/access.log combined

		SSLEngine on
		SSLCertificateFile	$PROJECTS_HOME/certs/$PROJECTNAME.test.pem
		SSLCertificateKeyFile $PROJECTS_HOME/certs/$PROJECTNAME.test-key.pem
		
		<FilesMatch ""\.(cgi|shtml|phtml|php)$"">
				SSLOptions +StdEnvVars
		</FilesMatch>

		<Directory /usr/lib/cgi-bin>
				SSLOptions +StdEnvVars
		</Directory>

	</VirtualHost>" > ~/$PROJECTNAME.conf
sudo mv ~/$PROJECTNAME.conf /etc/apache2/sites-available/$PROJECTNAME.conf
sudo ln -s /etc/apache2/sites-available/$PROJECTNAME.conf /etc/apache2/sites-enabled/$PROJECTNAME.conf

echo "${BOLDGREEN}Added vhost, $PROJECTNAME.conf added to /etc/apache2/sites-enabled/${TXTRESET}"

# update hosts file
echo 127.0.0.1  $PROJECTNAME >> $hosts_path
echo "Updated the hosts file"

# restart apache
echo "Enabling site in Apache..."
echo `a2ensite $PROJECTNAME`


echo "Restarting Apache..."
echo `/etc/init.d/apache2 restart`

