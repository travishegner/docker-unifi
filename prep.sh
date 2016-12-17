#!/bin/bash -e

mkdir -p /var/lib/unifi

echo "deb http://www.ubnt.com/downloads/unifi/debian unifi5 ubiquiti" > /etc/apt/sources.list.d/20ubiquiti.list
echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
#unifi key
apt-key adv --keyserver keyserver.ubuntu.com --recv C0A52C50
#mongodb key
apt-key adv --keyserver keyserver.ubuntu.com --recv EA312927

apt-get -q update
apt-get install -qy --force-yes mongodb-org binutils openjdk-8-jre-headless jsvc

apt-get download unifi
dpkg -i --force-depends unifi*.deb

service unifi stop
apt-get -q clean
rm -rf unifi*.deb
rm -rf /var/lib/apt/lists/*
chown nobody:nogroup /init.sh
chmod +x /init.sh

mkdir -p /usr/lib/unifi/work
chown -R nobody:nogroup /usr/lib/unifi/work
chown -R nobody:nogroup /var/log/unifi
chown -R nobody:nogroup /var/run/unifi
