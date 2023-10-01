#!/bin/bash
date -R
mkdir /tmp/test 
cd /tmp/test
mkdir ./a1d ./b56e ./6test
touch xy x2y 732;
echo "第一个条件下："
find ./ -name "[a, x, 6]*"
echo "第二个条件下："
find ./ -iname "[a-z][0-9]*"