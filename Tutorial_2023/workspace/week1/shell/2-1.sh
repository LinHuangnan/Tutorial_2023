#!/bin/bash
mkdir /tmp/scripts
cd /tmp/scripts
cp  -r /etc/pam.d /tmp/scripts | mv pam.d test
useradd "redhat"
sudo chown -R "redhat" test
sudo chmod -R g=---,o=--- test
