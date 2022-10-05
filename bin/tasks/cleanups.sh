# Move to project directory
cd "$PROJECTS_HOME/$PROJECTNAME"

# Clean ups
rm LICENSE
rm -rf .git
rm -rf bin
rm .env.example

# Remove Composers Platform Check
cd "$PROJECTS_HOME/$PROJECTNAME/vendor/composer/"
rm platform_check.php
sudo touch platform_check.php