#!/bin/bash
mkdir -p /tmp/scripts
cd /tmp/scripts
sudo cp -r /etc/pam.d test
sudo chown -R redhat test
sudo chmod -R o-rwx test