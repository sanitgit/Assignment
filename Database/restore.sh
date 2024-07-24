#!/bin/bash

# Variables
DB_NAME="my_database"    #database_name
DB_USER="db_admin"       #database_user
DB_HOST="localhost"      #database_host
BACKUP_DIR="/data/backups"  # path to backup directory
BACKUP_FILE=$1

# Check if backup file is provided
if [ -z "$BACKUP_FILE" ]; then
  echo "Usage: $0 backup_file.sql.gz"
  exit 1
fi

# Restore backup
gunzip -c $BACKUP_DIR/$BACKUP_FILE | psql -U $DB_USER -h $DB_HOST $DB_NAME

# Log completion
echo "Restored $DB_NAME from $BACKUP_FILE on $(date +"%Y%m%d%H%M%S")" >> $BACKUP_DIR/restore.log
