#!/bin/bash

# Variables
DB_NAME="your_database_name"
DB_USER="your_database_user"
DB_HOST="your_database_host"
BACKUP_DIR="/path/to/backup/directory"
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
