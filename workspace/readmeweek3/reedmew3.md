# week3
## task1
已完成，具体见源码
## task2
 ### &nbsp;&nbsp;   一.算法流程
 ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 1. 先将起点和终点的index（离散化的坐标，便于查找路径），position（真实坐标），pointer（指针）求出
  ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; 2.将起点标记为已经访问（id=1），并将其 <font color=Red>总价</font>算出，将起点放入openset中（<font color=Red>按照总价大小排序</font>）
   ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;<font color=Red>总价=当前代价+预估代价</font>
   ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;当前代价：起点到当前位置的距离
   ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;预估代价：从终点方块到当前方块大概要走多少步
   ##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp;求法：欧拉距离，曼哈顿距离，对角距离
##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;3：从openset依次取出待访问点，为终点时停止访问，对其搜索邻居，然后将其放入闭集，对其邻居节点进行判断
 &emsp;&emsp; （1）若邻居从未被访问 id=0，则进行总价运算后并且 标记好camefrom后加入到openset中，然后标记已被访问 id
 &emsp;&emsp; （2）若邻居已经被expend访问过，在开集中id=1，则对比当前代价的大小，若当前代价小则更新节点
 &emsp;&emsp; （3）若邻居已经加入到闭集 id=-1，则继续访问下一个邻居
##### &nbsp;&nbsp; &nbsp; &nbsp; &nbsp;4：获得路径，就从终点根据camefrom回溯 
 ### &nbsp;&nbsp;   二.运行结果
![1](.\ros\1.png)
![2](.\ros\2.png)
## task3
![10](.\ros\10.png)
### 一：不同启发函数对A*
#### &emsp;&emsp; （1）知识储备
![3](.\ros\3.png)
#### &emsp;&emsp; （2）曼哈顿距离：是两点间水平方向和垂直方向距离之和，如果点只能垂直和水平运动，则会是这种情况下的最短距离
![4](.\ros\4.png) （第一个是较短距离，第二个是复杂空间，第三个是较长但简单）
#### &emsp;&emsp;    欧拉距离，两点间的直线距离，是允许各个方向运动。
简单情况下![5](.\ros\5.png)
复杂情况下![6](.\ros\6.png)
#### &emsp;&emsp;   对角线距离：允许对角运动
中间简单情况![7](.\ros\7.png)
#### &emsp;&emsp; （3）对比：
在时间上大概是：对角线<曼哈顿<欧拉
在访问点数上：对角线=（约等于）曼哈顿<欧拉
### 二：tie_breaker对A*
#### &emsp;&emsp; （1）知识储备：为什么要加入tie—breaker
&emsp;&emsp;在搜索路径的时候会遇到总价相等的节点，打破路径的对称性，减少访问节点，加快搜索速度
#### &emsp;&emsp; （2）做法
  适当放大预估价：真实路径中，障碍物的存在，预估价远远小于真实预估价，适当放大仍然能保持预估价小于真实价
  cross：在对称中找到倾向，趋向于走直线而不是折线![8](.\ros\8.png)
#### &emsp;&emsp; （3）效果对比

在没有tie_breaker的对角线启发函数![7](.\ros\7.png)
有tie_breaker的情况下
![9](.\ros\9.png)
明显减少访问点个数，减少访问时间
### 二：JPS对A*
#### &emsp;&emsp; 1.知识储备
 &emsp;&emsp;理论上而言，比起A*是寻找所有邻居，JPS是寻找跳点，访问的点数更少，时间更快。
 &emsp;&emsp;在空旷的情况下A*速度快，而在复杂情况下JPS更优秀
 #### &emsp;&emsp; 2.实现JPS
   但是由于JPS的实现有点bug，导致测试结果，JPS远远比A*大，但是寻找到的路径几乎重合
   ![11](.\ros\11.png)



