# Assignment
Assignment

Question 3:
Instructions


Backup Script:

Replace your_database_name, your_database_user, and your_database_host with your actual database details.
Replace /path/to/backup/directory with the path to the directory where you want to store backups.
Make the script executable: chmod +x backup.sh
Schedule the script to run daily using cron:

crontab -e

Add the following line to schedule the backup at 2 AM every day:
0 2 * * * /path/to/backup.sh


Restore Script:

Replace your_database_name, your_database_user, and your_database_host with your actual database details.
Replace /path/to/backup/directory with the path to the directory where backups are stored.
Make the script executable: chmod +x restore.sh
To restore a backup, run:
sh
Copy code
./restore.sh db_backup_YYYYMMDDHHMMSS.sql.gz
These scripts will automate the backup and restoration process for your PostgreSQL database.