#!/bin/bash
echo "hello world!"
mkdir -p tmp/scripts
mkdir -p etc/pam.d
chmod +x ./my.sh
cd tmp/scripts
cp -r /home/rosnoetic/shell/etc/pam.d ./test/
sudo chown -R redhat /home/rosnoetic/shell/tmp/scripts/test
sudo chmod 770 /home/rosnoetic/shell/tmp/scripts/test
echo "Ok"

