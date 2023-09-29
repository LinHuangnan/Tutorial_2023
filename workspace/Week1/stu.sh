#!/bin/bash
echo stu.sh:  列出所有记录内容
echo stu.sh -a 100:张三:男:计算机:  写入100的信息，如果100存在，则输出100的信息
echo stu.sh -d 100:  删除100的信息，输入Y/yes确认 N/no否认
echo stu.sh -s 100:  输出100的消息
show_usage() {
    echo "用法: $0 [-a 学号:姓名:性别:专业] [-d 学号] [-s 学号]"
    exit 1
}
if [ $# -eq 0 ]; then
    cat stu.txt
    exit 0
fi


while [ "$1" != "" ]; do
    case $1 in
        -a)
            shift
            student_info="$1"
            student_id=$(echo "$student_info" | cut -d ":" -f 1)
            # 检查学号是否存在
            if grep -q "^$student_id:" stu.txt; then
                echo "学号 $student_id 已存在，记录内容为:"
                grep "^$student_id:" stu.txt
            else
                echo "$student_info" >> stu.txt
                echo "学号 $student_id 记录已添加。"
            fi
            ;;
        -d)
            shift
            student_id="$1"
            # 检查学号是否存在
            if grep -q "^$student_id:" stu.txt; then
                echo "学号 $student_id 的记录存在，是否要删除？ (y/n)"
                read confirmation
                if [ "$confirmation" == "y" ] || [ "$confirmation" == "yes" ]; then
                    grep -v "^$student_id:" stu.txt > temp.txt
                    mv temp.txt stu.txt
                    echo "学号 $student_id 的记录已删除。"
                elif [ "$confirmation" == "n" ] || [ "$confirmation" == "no" ]; then
                    echo "学号 $student_id 的记录未删除。"
                else
                    echo "无效的输入，未执行删除操作。"
                fi
            else
                echo "学号 $student_id 的记录不存在。"
            fi
            ;;
        -s)
            shift
            student_id="$1"
            # 检查学号是否存在
            if grep -q "^$student_id:" stu.txt; then
                grep "^$student_id:" stu.txt
            else
                echo "学号 $student_id 的记录不存在。"
            fi
            ;;
        *)
           show_usage
            ;;
    esac
    shift
done
