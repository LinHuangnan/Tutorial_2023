#!/bin/bash

# 1.显示当前系统日期和时间,而后创建目录/tmp/lstest
date "+%Y-%m-%d %H:%M"  
echo "--------"
mkdir /tmp/lstest
echo "created /tmp/lstest"

# 2.切换工作目录至/tmp/lstest
cd /tmp/lstest
echo "now change to /tmp/lstest"

# 3.创建目录a1d，b56e，6test
mkdir ald b56e 6test
echo "created dictionaries: ald,b56e,6test"

# 4.创建空文件xy，x2y，732
touch xy x2y 732
echo "created files: xy,x2y,732 "
echo "---------"

# 5.列出当前目录下以a，x或者6开头的文件或目录
ls | grep -E  '^6.|^a.|^x.' 
echo "---------"


# 6.列出当前目录下以字母开头，后跟一个任意数字，而后跟任意长度字符的文件或目录
ls | grep -E '^[a-zA-Z][0-9].'
echo "-----END------"