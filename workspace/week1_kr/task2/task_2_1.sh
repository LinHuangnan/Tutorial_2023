#! /bin/bash
mkdir /tmp/scripts
cd /tmp/scripts
cp -r /etc/pam.d ./test
chown -R redhat ./test
chmod -R o=--- ./test
