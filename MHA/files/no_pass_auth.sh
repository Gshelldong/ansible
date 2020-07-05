#!/bin/bash

stat=`rpm -qa | grep sshpass|wc -l`
if [ $stat -eq 0 ];then
	install=`yum install -y sshpass`
fi

if [ ! -f /root/.ssh/id_rsa ];then
	ssh-keygen -t rsa -P "" -f /root/.ssh/id_rsa  &>/dev/null
fi

ip='52 53 54'
for i in $ip;
do
        sshpass -p1 ssh-copy-id -i /root/.ssh/id_rsa.pub -o StrictHostKeyChecking=no root@172.16.1.$i &>/dev/null
done
