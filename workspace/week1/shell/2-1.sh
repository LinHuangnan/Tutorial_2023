sudo su;
mkdir /tmp/scripts && cd $_
cp /etc/pam.d /tmp/scripts | mv pam.d test
chown -R redhat test
chmod -R g=000,o=000 test
