#!/bin/sh
nginxpid=$(ps -C nginx --no-header|wc -l)

if [ $nginxpid -eq 0 ];then
        systemctl stop keepalived
fi
