#!/bin/bash

# Script specific vars
SCRIPT_LABEL='for Linux Ubuntu 22.04.1'
SCRIPT_VERSION='1.0.5'

# Vars needed for this file to function globally
CURRENTFILE=`basename $0`

# Determine scripts location to get imports right
if [ "$CURRENTFILE" = "matrix.sh" ]; then
  SCRIPTS_LOCATION="$( pwd )"
  source ${SCRIPTS_LOCATION}/tasks/variables.sh
  source ${SCRIPTS_LOCATION}/tasks/header.sh
  exit
else
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
  ORIGINAL_FILE=$( readlink $DIR/$CURRENTFILE )
  SCRIPTS_LOCATION=$( dirname $ORIGINAL_FILE )
fi

# Final note about server requirements
echo ""
echo "${WHITE}Using this start script requires you have dev server installed and working:
 As of now we use Lamp stack
${TXTRESET}"

# Import required variables
source ${SCRIPTS_LOCATION}/tasks/variables.sh

# Script header
source ${SCRIPTS_LOCATION}/tasks/header.sh

# Ask names and credentials
source ${SCRIPTS_LOCATION}/tasks/askvars.sh

# Init project and run composer
source ${SCRIPTS_LOCATION}/tasks/initproject.sh

# Create database
source ${SCRIPTS_LOCATION}/tasks/initdb.sh

# Update .env
source ${SCRIPTS_LOCATION}/tasks/dotenv.sh

# WP-Cli and WP installation
source ${SCRIPTS_LOCATION}/tasks/wp-cli.sh

# Clean up files that are not needed
source ${SCRIPTS_LOCATION}/tasks/cleanups.sh

# Set up permissions
source ${SCRIPTS_LOCATION}/tasks/permissions.sh

# SSL certificates
source ${SCRIPTS_LOCATION}/tasks/certs.sh

# Init GitHub company repository
source ${SCRIPTS_LOCATION}/tasks/github.sh

# Set up virtual hosts
source ${SCRIPTS_LOCATION}/tasks/vhosts.sh

#  restarts and reloads Apache Server
echo "${BOLDGREEN}Local environment up and running.${TXTRESET}"
echo "${YELLOW}Updating hosts file...${TXTRESET}"
sudo -- sh -c "echo 127.0.0.1 ${PROJECTNAME}.test >> /etc/hosts"

echo "Restarting Apache..."
echo /etc/init.d/apache2 restart

# The end

source ${SCRIPTS_LOCATION}/tasks/footer.sh
