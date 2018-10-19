#!/bin/bash -e

echo "deb http://www.ubnt.com/downloads/unifi/debian stable ubiquiti" > /etc/apt/sources.list.d/20ubiquiti.list
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.6 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.6.list

#unifi key
apt-key adv --keyserver keyserver.ubuntu.com --recv 06E85760C0A52C50
#mongodb key
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2930ADAE8CAF5059EE73BB4B58712A2291FA4AD5

apt-get -q update
apt-get install -qy openjdk-8-jre-headless unifi

apt-get -q clean
rm -rf /var/lib/apt/lists/*
