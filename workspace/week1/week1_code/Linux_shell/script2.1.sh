#!/bin/bash

mkdir /tmp/scripts
# 1.创建一个目录/tmp/scripts
echo "have created dictionary"

cd /tmp/scripts
# 2.切换工作目录至此目录中
echo "have changed dictionary to `pwd`"

cp /etc/pam.d ./test -r
# 3.复制/etc/pam.d目录至当前目录，并重命名为test
echo "have created test"

# 如果该账号已经初始化root成功,且已有redhat用户
sudo chown -R redhat test 
# 4.将当前目录的test及其里面的文件和子目录的属主改为redhat
echo "now test's owner is redhat"

sudo chmod -R o-r-w-x test
# 5.将test及其子目录中的文件的其它用户的权限改为没有任何权限
echo "now other users' module have been taken"

