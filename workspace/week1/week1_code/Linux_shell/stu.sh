#!/bin/bash

# 函数里面的$1，其实就是脚本的$2

function judgeA(){
    result=$( grep -E "^$1" ./stu.txt )
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果

    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1
    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "This guy doesn't exist"
        echo "$1" >> ./stu.txt
        echo "I have helped u append this guy"

    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        echo "This guy has been registered"
        echo "See..."
        echo "$result"
    fi  
}

function judgeD(){
    result=$(grep -E "^$1:" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果

    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1

    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "Wrong!"
        echo "U can't delete a guy who doesn't exist"
    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        stu_sub=$(grep -E -v "^$1:" ./stu.txt)
        # 保存一份无该学生信息的副本

        echo "I will help u remove this guy,are u sure???"
        echo "$result"
        # 显示该学生信息作为提示，并提出确认

        read -p "please enter y/yes or n/no to confirm  :" decision
        # 使用read命令读取终端输入

        if [ $decision == "y" ] || [ $decision == "yes" ]
        then
            echo "$stu_sub" > stu.txt
            echo "Well,this world is finally quiet "
            echo "(This guy's message has been wiped)"
            # 利用覆盖实现删除

        elif [ $decision == "n" ] || [ $decision == "no" ]
        then
            echo "Well,this guy is alive"
            echo "(This guy's message hasn't been wiped)"
        fi
    fi  
}

function judgeS(){
    result=$(grep -E "^$1:" ./stu.txt)
    # 通过把参数传入grep指令和正则表达式来在stu.txt中筛选出对应学生的信息
    # 并使用变量result来存储这个查询结果

    bool=$?
    # 存储grep命令的返回值，用以进行条件判断
    # 用变量bool的来存储这个返回值，也防止多个命令执行使$?的值不对应grep命令
    # bash中，命令正常执行返回值为0，反之返回1

    if [ $bool -eq 1 ] # 该情况对应没有匹配成功
    then
        echo "Wrong！"
        echo "This guy missed in the forest"
        echo "(The id u enter is wrong)" # 补充提示，确定告诉用户查无此人

    elif [ $bool -eq 0 ] # 该情况对应匹配成功
    then
        echo "This guy has been registered"
        echo "See..."
        echo "$result"
    fi  
}


case $1 in
    -a)
        judgeA $2
    ;;

    -d)
        judgeD $2
    ;;

    -s)
        judgeS $2
    ;;

    "")
        cat ./stu.txt
    ;;

    *)
        echo "Wrong option!,u should enter the correct one "
        cat ./help_stu.txt
    ;;
esac






