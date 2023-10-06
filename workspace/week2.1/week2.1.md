# solidworks的安装

## 总括
### 1 solidworks的正常步骤安装
### 2 本周学习中遇到并解决的安装问题
> **1 正常安装步骤**

>> 1.1 关闭电脑防火墙以及防毒软件
>![关闭防火墙]("C:\Users\Young\Pictures\Screenshots\2.1.png")
>
>> 1.2 打开Net Framework功能
>![打开Net Framework功能]("C:\Users\Young\Pictures\Screenshots\2.2.png")
>
>> 1.3 录入注册表
>![注册表]("C:\Users\Young\Pictures\Screenshots\2.3.png")
>![注册表确认]("C:\Users\Young\Pictures\Screenshots\2.4.png")
>![注册表确认]("C:\Users\Young\Pictures\Screenshots\2.5.png") 
>
>> 1.4 将安装包中的SolidWorks_Flexnet_Server文件夹复制到C盘中。并且以管理员身份打开服务（之前已经打开过的，要先关闭服务再重新打开）
>>![SolidWorks_Flexnet_Server文件夹]("C:\Users\Young\Pictures\Screenshots\2.6.png")
>>![服务成功打开]("C:\Users\Young\Pictures\Screenshots\2.7.png")
>
>> 1.5 打开安装包中的setup 并且禁止英特网的访问
>![setup]("C:\Users\Young\Pictures\Screenshots\2.8.png")
>![禁止internet]("C:\Users\Young\Pictures\Screenshots\2.9.png")
>
>> 1.6 一直点击下一步，直至选择安装位置。选择D盘新建的solidworks文件夹，确保空间足够
>![下一步]("C:\Users\Young\Pictures\Screenshots\2.10.png")
>![选择安装地址]("C:\Users\Young\Pictures\Screenshots\2.12.png")
>
>> 1.7 确定端口服务器进行安装
>![端口服务器]("C:\Users\Young\Pictures\Screenshots\2.13.png")
>
>> 1.8 勾选“不，谢谢” 进行下一步
>![安装完成]("C:\Users\Young\Pictures\Screenshots\2.14.png")
>
>>1.9 进行破解 将安装包Program File文件夹下的文件复制到新建的solidworks文件夹下
>![Program File文件夹下的文件]("C:\Users\Young\Pictures\Screenshots\2.15.png")
>![复制到solidworks]("C:\Users\Young\Pictures\Screenshots\2.16.png")
>
>> 1.10 打开SolidSQUADLoaderEnabler文件，点击正确直至无提示
>![点击确定]("C:\Users\Young\Pictures\Screenshots\2.17.png")
>![点击确定]("C:\Users\Young\Pictures\Screenshots\2.18.png")
>
>> 安装完成
>![安装完成]("C:\Users\Young\Pictures\Screenshots\2.19.png")



> **2 安装过程中遇到并解决的问题**
> > 问题来源
> >第一次安装时，想要安装最新的solidworks2023版本，但是网上下载的注册表并不支持2023版本（第一次出错，忘记留下截图）
> 
> >2.1 想要下载2021版本时 出现如下错误：该产品的window installer没按预期运算，下载了错误报告后发现最后一行出现如下错误。
> ![报错]("C:\Users\Young\Pictures\Screenshots\2.21.png")
> > 判断应该是上一个版本未删除干净。
> 为了彻底清除2023版本所遗留的所有文件，这一周中探索了如下几种方法，并最终成功安装2021版
> 
>> 打开任务管理器，终止一切关于solidwork的进程
>![任务管理器]("C:\Users\Young\Pictures\Screenshots\2.22.png")
>
>>停止有关于solidworks的一切服务
>![停止服务]("C:\Users\Young\Pictures\Screenshots\2.23.png")
>
>>将上一版本的注册表删除
>> 删除Hkey_Current_User下software关于solidworks的文件夹
>> 删除Hkey_Local_machine下software关于solidworks的文件夹
>![删除注册表]("C:\Users\Young\Pictures\Screenshots\2.24.png")
>
>>最后使用windows installer clean up 删除有关于solidworks的残余文件
>![windows installer clean up]("C:\Users\Young\Pictures\Screenshots\2.20.png")


>>2.2 安装时出现错误
>>需在产品选择界面取消选择SOLIDWORKS Electrical选项
>![安装错误]("C:\Users\Young\Pictures\Screenshots\2.11.png")


### 注: 本周在solid works的安装中遇到了不少麻烦,在找寻不同资料后成功解决,对我而言有着十足的收获.但是solidworks的使用课程和四活动度机械臂的设计仍在加速学习中,完成后会尽快提交.




