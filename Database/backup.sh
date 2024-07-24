#!/bin/bash

# Variables
DB_NAME="your_database_name"
DB_USER="your_database_user"
DB_HOST="your_database_host"
BACKUP_DIR="/path/to/backup/directory"
DATE=$(date +"%Y%m%d%H%M%S")

# Create backup
pg_dump -U $DB_USER -h $DB_HOST $DB_NAME | gzip > $BACKUP_DIR/db_backup_$DATE.sql.gz

# Find and delete backups older than 7 days
find $BACKUP_DIR -type f -name "*.sql.gz" -mtime +7 -exec rm {} \;

# Log completion
echo "Backup for $DB_NAME completed on $DATE" >> $BACKUP_DIR/backup.log
