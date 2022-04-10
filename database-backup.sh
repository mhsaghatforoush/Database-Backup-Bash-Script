#!/bin/bash
################################################################
##
## MySQL Database Backup Script
## Author : Mohammad hosein Saghatforoush | +989212210486
##
################################################################

export PATH=/bin:/usr/bin:/usr/local/bin
TODAY=`date +"%m-%d-%Y"`
################################################################
################## Update below values ########################

DB_BACKUP_PATH='/var/backup'
MYSQL_HOST='localhost'
MYSQL_PORT='3306'
MYSQL_USER='root'
MYSQL_PASSWORD="yourpassword"
DATABASE_NAME='yourdb'

#################################################################

mkdir -p ${DB_BACKUP_PATH}/${TODAY}
echo "Backup started for database - ${DATABASE_NAME}"

mysqldump -h ${MYSQL_HOST} \
-P ${MYSQL_PORT} \
-u ${MYSQL_USER} \
-p${MYSQL_PASSWORD} \
${DATABASE_NAME} | gzip -c > ${DB_BACKUP_PATH}/${TODAY}/${DATABASE_NAME}-${TODAY}.sql.gz

if [ $? -eq 0 ]; then
echo "Database backup successfully completed"
else
echo "Error found during backup"
exit 1
fi
