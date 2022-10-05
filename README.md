# Matrix Development Stack

Matrixstack helps you get your projects started locally with modern Wordpress development tools and project structure. It will save time by automating tasks with a DRY development principle.

After setting up, you can create a new Wordpress project based on a modified version of [bedrock](https://roots.io/bedrock/) just by running:

```
createproject
```

**PLEASE NOTE***

The script is focused on my own workflow, it assumes a lot of things about how you will work. It may need to be tweaked to make it work for you.
For example it assumes you use Linux Ubuntu 20.04, always start your projects in home/projects, use XXXX.test as your host name url, store your SSL certs in 
/var/www/certs, use an Apache server with your projects aqnd your current projects home directory will be located in /var/www/....

# Features

- Automatic MySQL-database generation
- Automatic Creation of Apache server
- Automatic host conf files creation 
- Automatic update of hosts file
- Automatic set up and installation of SSL cert
- Sets up WP user, admin email and pass.
- Installs Wordpress
- Installs Wordpress development plugins
- Installs plugins we typically use in Matrix eg: ACF, Yoast, AIOWPS, Wordfence etc
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

2. Change directory to matrixstack and then bin folder (change below to your own username)

```
cd /home/YourUserName/Projects/matrixstack/bin
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


 file:///home/ben/Pictures/Screenshots/Screenshot%20from%202022-10-05%2014-24-17.png



