Script allows you to backup your Wordpress or any MYSQL based site to a backup directory.
Edit the script and replace variables prior to running it.

This script can be placed into a cronjob for an automatic backups.

Recovery: 
It's easy as extracting files from tar and then replace the below command with your variables in the script

sudo mysql -u(MYSQL_USER) -p(MYSQL_PASSWORD) DATABASE_NAME < DATABASE_NAME.sql

sudo mv WEBSITE_NAME/ WEBSITE_PATH/
