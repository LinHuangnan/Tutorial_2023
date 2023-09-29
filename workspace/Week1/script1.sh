#!/bin/bash
mkdir /tmp/scripts
cd /tmp/scripts
cp -r /etc/pam.d ./test
sudo chown -R redhat test
chmod -R o-rwx test

