#/bin/bash
filename=$(hostname)_database_$(date +%F)

mkdir -p /backup/$filename
mysqldump -uroot -p123 -A > /backup/$filename/${filename}.sql
cd /backup/$filename && tar -czf ${filename}.tar.gz ${filename}.sql && rm -fr ${filename}.sql
md5sum /backup/$filename/${filename}.tar.gz > /backup/$filename/${filename}.md5

export RSYNC_PASSWORD=123
cd /backup && rsync -az $filename rsync_backup@172.16.1.41::backup &> /dev/null
find /backup/ -type d -name "*database*" -mtime +7 |xargs rm -fr
