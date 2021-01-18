#!/bin/bash
export PATH=/bin:/usr/bin:/usr/local/bin

# Update the below variables for your situation

# Location of where you'd like your backups to reside
BACKUP_PATH='/somebackup/location/'

# MYSQL Databse Information
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='mysqluser'
MYSQL_PASSWORD='mysqlpassword'
DATABASE_NAME='mysqldatabasename'

# Website Settings
WEBSITE_NAME='websitename'
WEBSITE_PATH='/var/www/websitename/'

# Retention Settings
BACKUP_RETAIN_DAYS=20 ## Number of days to keep local backup copy
TODAY=`date +"%m-%d-%y"`


# Backup Script Begins 

# Mysql Backup
mkdir -p ${BACKUP_PATH}/${TODAY}
echo "Backup started for database - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
-P ${MYSQL_PORT} \
-u ${MYSQL_USER} \
-p${MYSQL_PASSWORD} \
${DATABASE_NAME} | gzip > ${BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz

if [ $? -eq 0 ]; then
echo "Database backup successfully completed"
else
echo "Error found during backup"
exit 1
fi

# Website Backup
tar -zcvpf $BACKUP_PATH/${TODAY}/$WEBSITE_NAME-$TODAY.tar.gz $WEBSITE_PATH


# Remove backups older than {BACKUP_RETAIN_DAYS} days
DELDATE=`date +"%d%b%Y" --date="${BACKUP_RETAIN_DAYS} days ago"`

if [ ! -z ${BACKUP_PATH} ]; then
cd ${BACKUP_PATH}
if [ ! -z ${DELDATE} ] && [ -d ${DELDATE} ]; then
rm -rf ${DELDATE}
fi
fi

# Recovery, extract files from tar and then replace the below command with your variables in the script above
# sudo mysql -u(MYSQL_USER) -p(MYSQL_PASSWORD) DATABASE_NAME < DATABASE_NAME.sql
# sudo mv WEBSITE_NAME/ WEBSITE_PATH/