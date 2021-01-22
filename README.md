This script allows you to backup your Wordpress or any MYSQL based site to a backup directory of your choosing.

## Install: 
* Edit the script and replace variables prior to running it.
* This script can be placed into a cronjob for automatic backups.


## Recovery: 
It's easy as extracting your backup files from the tar file and then replace the commands below with your variables in the script

* ```sudo mysql -u(MYSQL_USER) -p(MYSQL_PASSWORD) DATABASE_NAME < DATABASE_NAME.sql```
* ```sudo mv WEBSITE_NAME/ WEBSITE_PATH/```
