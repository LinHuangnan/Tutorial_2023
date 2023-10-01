#!/bin/bash
echo "当前系统日期和时间为："
date
mkdir /tmp/lstest
cd /tmp/lstest
mkdir a1d b56e 6test
touch xy x2y 732
echo "以a,x或者6开头的文件或目录为:"
ls -d [ax6]*
echo "以字母开头，后跟任意数字，而后跟任意字符长度字符的文件或者目录为："
ls -d [a-zA-Z]*[0-9]*