#!/bin/bash
# Make sure only root can run our script
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

sudo mkdir -p /opt/storage/cicd-gogs/data
sudo mkdir -p /opt/storage/cicd-gogs/mysql  
sudo mkdir -p /opt/storage/cicd-jenkins      
sudo mkdir -p /opt/storage/cicd-nexus       

sudo chown -R nfsnobody:nfsnobody /opt/storage/cicd-gogs/data
sudo chmod -R 777 /opt/storage/cicd-gogs/data
 
sudo chown -R nfsnobody:nfsnobody /opt/storage/cicd-gogs/mysql
sudo chmod -R 777 /opt/storage/cicd-gogs/mysql
 
sudo chown -R nfsnobody:nfsnobody /opt/storage/cicd-jenkins
sudo chmod -R 777 /opt/storage/cicd-jenkins
 
sudo chown -R nfsnobody:nfsnobody /opt/storage/cicd-nexus
sudo chmod -R 777 /opt/storage/cicd-nexus



sudo echo "/opt/storage/cicd-gogs/data    127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
sudo echo "/opt/storage/cicd-gogs/mysql  127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
sudo echo "/opt/storage/cicd-jenkins      127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
sudo echo "/opt/storage/cicd-nexus        127.0.0.1(rw,sync,no_root_squash)" >> /etc/exports
