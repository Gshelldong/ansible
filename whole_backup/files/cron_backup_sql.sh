#/bin/bash
ssh root@172.16.1.51  -o StrictHostKeyChecking=no -C "sh /root/db_backup_sql.sh"
