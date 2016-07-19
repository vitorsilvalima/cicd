#!/bin/bash
green='\033[0;34'
reset=`tput sgr0`
#create the cicd project where the environment will be deployed
oc new-project cicd --display-name="CI/CD"
echo "${green} Project CICD has been created ${reset}"
sleep 5
oc project cicd
#deploys gogs on openshift
oc process -f gogs-template.yaml | oc create -f -
sleep 5
echo "${green} Gogs has been deployed ${reset}"
#deploys jenkins on openshift
oc process -f jenkins-template.yaml | oc create -f -
sleep 5
echo "${green} Jenkins has been deployed ${reset}"
#deploys mysql on openshift to be used by gogs
oc process -f mysql-template.yaml | oc create -f -
sleep 5
echo "${green} MySQL has been deployed ${reset}"
#deploys nexus on openshift
oc process -f nexus-template.yaml | oc create -f -
echo "${green} Nexus has been deployed ${reset}"
