file="stu.txt";  
#搜索记录
check(){
        grep -q "$1:" "$file"
}
#打印用法
show_use(){
        echo "命令错误"
        echo "用法是："
        echo "stu.sh        :显示所有记录"
        echo "stu.sh -a 记录      : 添加一个记录"
        echo "stu.sh -d id      :删除一个记录"
        echo "stu.sh -s id      :搜索一个记录"
        exit 1
}
#显示文件
show(){
        cat $file
}

if [ $# -eq 0  ]; then
    cat $file
elif [ $# -eq 2 ]; then
    case $1 in
    -a)
        massage=$(echo $2 | cut -d ':' -f1);
        if check $massage; then
        echo "记录$massage 已经存在"
        grep "$massage:" $file
        exit 1
        else
            echo "记录被加入"
            echo "$2" >> $file
        fi
        ;;
    -d)
       massage1=$(echo $2 | cut -d ':' -f1);
        if check $massage1; then
        read -p "你确定删除?(y/n)" confirm
        if [ $confirm=="y"  ]; then
            sed -i "/$2/d" "$file"
            echo "删除成功"
        else
            echo "操作取消"
        fi
        else
            echo "不存在该条记录"
        fi
        ;;
    -s)
        massage2=$(echo $2 | cut -d ':' -f1);
        if check $massage2; then
            echo "记录被找到"
            grep "$massage2:" $file
        else
            echo "不存在该条记录"
        fi
        ;;
    *)
        show_use;
        exit
        ;;
    esac
else
    show_use
fi