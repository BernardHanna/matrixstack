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
- Automatic host settings for development server
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
- Chnages WP login to /wp/wp-admin for better security
- Deletes default posts and pages
- updates descriptionmm
- updates language to en_GB
- deletes default themes and plugins
- sets the timezone to Dublin
- removes pingbacks
- Activates plugins





