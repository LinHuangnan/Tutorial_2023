data="stu.txt";
sid="学号";
sname="姓名";
ssex="性别";
smajor="专业";

help(){
  echo "不加参数，显示所有记录";
  echo "-a 添加记录";
  echo "-d 删除记录";
  echo "-s 搜索记录";
}
#  $#传给脚本的参数个数  -eq相等 0 表示传参为0个
if [ $# -eq 0  ];
then
  printf "%-s\t%-s\t%-s\t%-s\n" $sid $sname $ssex $smajor;
  #cat $data |awk -F ":" '{printf("%-s\t%-s\t%-s\t%-s\n",$1,$2,$3,$4);}';二选一     % -s 输出字符串  \t 水平制表符
  cat $data|tr ':' '\t'; 
  #将文档里面的：转换为制表符
  exit;
fi

case $1 in 
-a)
#grep -q静默输出查找 $2第二个参数 2>&1将标准错误（2）的输出重定位到标准输出（1）中，$参数是靠空格区分的
  if ! grep -q $2 $data 2>&1;
  then
        echo $2>>$data;
        exit;
        # >是将信息重定向到文件中，文件重名则覆盖，>>向文件中追加信息
  else
        echo "存在";
        printf "%-s\t%-s\t%-s\t%-s\n" $sid $sname $ssex $smajor;
        echo $2|tr ':' '\t';
  fi
;;
-d)
  if ! grep -q $2 $data 2>&1;
  then
        echo "记录不存在。。";
        exit;
  else
        read -p "确定要删除？(y/n)" confirm;
        if [ $confirm == "y" -o $confirm == "yes" ];
        then
                sed -i "/$2/d" $data 2>&1;
                #/$2/d 删除每行中匹配到$2的行内容，-i就是将匹配后的结果覆盖原文件，改变原文件
        elif [ $confirm == "n" -o $confirm == "no" ];
        then
                echo "用户取消";
        else
                echo "错误的输入";
        fi
  fi
;;
-s)
  if ! grep -q $2 $data 2>&1;
  then
        echo "记录不存在。。";
        exit;
  else
        printf "%-s\t%-s\t%-s\t%-s\n" $sid $sname $ssex $smajor;
        #sed -n "/$2/p" $data |tr ':' '\t';
        grep $2 $data|tr ':' '\t';
  fi
;;
*)
  help
  #调用函数
;;
esac

