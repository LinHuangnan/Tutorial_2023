#!/bin/bash

file="stu.txt"

#列出所有记录内容
showAll_fuc()
{
    cat "$file"
}

#添加记录
add_fuc()
{
    local arg=$1
    if grep -q "^$arg" "$file"
    then
        echo "${arg}已存在，无需添加"

    else
        echo "$arg">>"$file"
        echo "${arg}不存在，已成功写入"
    fi
}

#删除记录
del_fuc()
{
    local arg=$1
    if grep -q "^$arg" "$file"
    then
        echo "${arg}已存在，是否删除?(y/n)"
        read choice
        case $choice in
            y|yes)
                sed -i "/^$arg/d" "$file"
                echo "删除成功"
                ;;
            n|no)
                echo "放弃删除"
                ;;
            *)
                echo "请输入有效命令"
        esac
    else
        echo "${arg}不存在"
    fi
    
}

#查找信息
find_fuc()
{
    local arg=$1
    if grep -q "^$arg" "$file"
    then
        echo "${arg}存在，为："
        grep "^$arg" "$file"
    else
        echo "${arg}不存在"
    fi
}

#错误提示
note_fuc()
{
    echo "参数不正确"
    echo "输入'-a'来写入信息"
    echo "输入'-d'来删除信息"
    echo "输入'-s'来查询信息"
}

#输入参数判断
if [ $# -eq 0 ]
then
    showAll_fuc
else
    case $1 in
        -a)
            add_fuc "$2"
            ;;
        -d)
            del_fuc "$2"
            ;;
        -s)
            find_fuc "$2"
            ;;
        *)
            note_fuc
            ;;
    esac
fi
