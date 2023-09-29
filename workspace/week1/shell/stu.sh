#搜索记录
check(){
        grep -q "$1:" stu.txt
}
#打印用法
show_use(){
        echo "用法是："
        echo "stu.sh        :显示所有记录"
        echo "stu.sh -a 记录      : 添加一个记录"
        echo "stu.sh -d id      :删除一个记录"
        echo "stu.sh -s id      :搜索一个记录"
        exit 1
}
#显示文件
show(){
        cat stu.txt
}
#添加记录
add(){
    id  = $(echo $1 | cut -d ':' -f1)
    if check $id; then
    echo "记录 $id 已经存在"
    grep "$id:" stu.txt
    exit 1
    else
        echo "$1" >> stu.txt
    fi
}
#删除记录
Delete(){
    id = "$1"
    if check $id; then
    read -p "你确定删除 $id?(yes/no)" confirm
    if [[$confirm == "y" || $confirm == "yes"]]; then
        sed -i "/^$id:/d" stu.txt
    fi
    else
        echo "不存在该条记录"
    fi
}
#搜索记录
search(){
    id = "$1"
    if check $id; then
        grep "^$id:"  stu.txt
    else
        echo "不存在该条记录"
    fi
}

if [ $#==0  ]; then
    show
fi
if [ $#==2 ]; then
    op=$1
    argument=$2
    case $op in
    -a)
        add $argument
        ;;
    -d)
        Delete $argument
        ;;
    -s)
        search $argument
        ;;
    *)
        show_use
        ;;
    esac
fi
if [ [$#!=0 && $#!=2 ] ];then
    show_use    
fi
