#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

mkdir -p /opt/storage/cicd-gogs/data
mkdir -p /opt/storage/cicd-gogs/mysql  
mkdir -p /opt/storage/cicd-jenkins      
mkdir -p /opt/storage/cicd-nexus       

chown -R nfsnobody:nfsnobody /opt/storage/cicd-gogs/data
chmod -R 777 /opt/storage/cicd-gogs/data
 
chown -R nfsnobody:nfsnobody /opt/storage/cicd-gogs/mysql
chmod -R 777 /opt/storage/cicd-gogs/mysql
 
chown -R nfsnobody:nfsnobody /opt/storage/cicd-jenkins
chmod -R 777 /opt/storage/cicd-jenkins
 
chown -R nfsnobody:nfsnobody /opt/storage/cicd-nexus
chmod -R 777 /opt/storage/cicd-nexus



echo "/opt/storage/cicd-gogs/data    127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
echo "/opt/storage/cicd-gogs/mysql  127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
echo "/opt/storage/cicd-jenkins      127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
echo "/opt/storage/cicd-nexus        127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
