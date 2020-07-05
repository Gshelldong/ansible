#/bin/bash
find /backup/ -type d -name "db*" -mtime +180|xargs rm -fr 
