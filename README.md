# Matrix Development Stack

Matrixstack helps you get your projects started locally with modern Wordpress development tools and project structure. It will save time by automating tasks with a DRY development principle.

After setting up, you can create a new Wordpress project based on a modified version of [bedrock](https://roots.io/bedrock/) just by running:

```
createproject
```

**PLEASE NOTE***

The script is focused on my own workflow, it assumes a lot of things about how you will work. It may need to be tweaked to make it work for you.
For example it assumes you use Linux Ubuntu 20.04, always start your projects in ~/Projects, use XXXX.test as your host name url, store your SSL certs in 
/var/www/certs, use an Apache server with your projects and your current projects home directory will be located in /var/www/....

# Features

- Automatic MySQL-database generation
- Automatic Creation of Apache server
- Automatic host conf files creation 
- Automatic update of hosts file
- Automatic set up and installation of SSL cert
- Sets up WP user, admin email and pass.
- Installs Wordpress
- Installs Wordpress development plugins
- Installs plugins we typically use in Matrix such as Yoast
- Automatic Github repo initialization
- Capistrano 3 deployment templates bundled in bin/createproject.sh
- Allows you to use Composer to manage WordPress installation
- Install WP packages from [WordPress Packagist](https://wpackagist.org/)
- sets up dotenv-environments for development, staging and production
- Adds Premium plugin licences
- Sets up (modified version of)Bedrock
- Changes WP login to /wp/wp-admin for better security
- Deletes default posts and pages
- updates description
- updates language to en_GB
- deletes default themes and plugins
- sets the timezone to Dublin
- removes pingbacks
- Activates plugins
- Customizable to suit your workflow eg, change the plugins pre installed etc


# Requirements

- Linux Ubuntu OS
- mkcert
- Composer v2
- Basic knowledge about bash scripting 
- Basic knowledge npm packages, bundle, composer etc.
- Optional: Access to staging and production servers that supports sftp and git
- Projects located under home/Projects
- Git
- PHP >= 7.2
- Ruby >= 2.6
- Perl
- WP-CLI
- Apache
- mySQL

# Installation

1. Clone this repo to your Projects directory: /home/YourUserName/Projects

```
git clone https://github.com/bernardhanna/matrixstack.git
```

2. Change directory to matrixstack and then bin folder

```
cd /Projects/matrixstack/bin
```

3. Run the setup script for the first and only time

```
bash matrix.sh
```

4. Follow any onscreen instructions to link this file to system level.

5. Create your new project

```
createproject
```

From here the on screen prompts will guide you


![Screenshot from 2022-10-05 14-32-15](https://user-images.githubusercontent.com/47034430/194073029-7814a09f-ca0b-40f9-94c1-d4e347e1e595.png)

6. Note when the project loads you will get a whitescreen as there is no Theme installed. You will know if everything worked by accessing the admin


## Preinstallation

WP-Cli is included in matrixstack per project via composer.json but won't work by default globally. You'll need this alias on your Linux .bashrc or .bash_profile file:
```
alias wp='./vendor/wp-cli/wp-cli/bin/wp'
```

The ```createproject``` script assumes:

- You use Linux Ubuntu as OS
- You use .test as your domain extension
- You will be using Apache
- Your SSL certs will be stored in /var/www/certs
- Your project folder will be located: var/www/PROJECT-NAME


## What matrix.sh does

![Screenshot from 2022-10-05 14-43-53](https://user-images.githubusercontent.com/47034430/194075677-f1bfc637-5af8-4538-aa26-5c4b264fb6fc.png)

1. Runs composer create-project with matrixstack settings
2. Installs our default WordPress plugins and updates them
3. Sets up MySQL database
4. Installs capistrano deployment tool
5. Generates default capistrano configs (config/deploy.rb, config/deploy/staging.rb, config/deploy/production.rb) with your GitHub project details and paths
6. Sets up WordPress configs (wp-config credentials to .env) and salts automatically
7. Installs WordPress under its own subdirectory /wp (thus, admin located in example.test/wp/wp-admin)
8. Sets up default admin user as not "admin" for security
9. Removes default WordPress posts, themes and plugins and everything else not so useful
10. Activates default plugins, timezones, permalinks
11. Flushes rewrites, adds support for permalinks and webfonts
12 . Sets up file permissions
13. Inits a GitHub repository
14. Creates a HTTPS certificate
15. Sets up a virtual host for development environment
16. Updates /etc/hosts file
17. Restarts development server

# Next Steps (get involved)

- Fix issue with ACF pro breaking the script when trying to auto install
- Create a goLive script which checks everything in our QA sheet, installs and configures plugins like All in one security, Wordfence, WP rocket etc before deploying.
- Create Mac/Windows version
- Create a starter theme & script and incorporate
- Create a Wiki outlining whats different with the modified version of bedrock included and why its different
