# STM32最小系统板学习

### 1，流水灯
> ![流水灯FlyMcu]("C:\Users\Young\Desktop\空队考核\week3\image\流水灯Fly.png")
> ![流水灯代码]("C:\Users\Young\Desktop\空队考核\week3\image\流水灯代码.png")

### 2，按键灯
> ![按键灯FlyMcu]("C:\Users\Young\Desktop\空队考核\week3\image\按键Fly.png")
> ![按键灯代码]("C:\Users\Young\Desktop\空队考核\week3\image\按键代码.png")

### 3，OLED显示屏
> ![OLED-FlyMcu]("C:\Users\Young\Desktop\空队考核\week3\image\OLED-Fly.png")
> ![OLED代码]("C:\Users\Young\Desktop\空队考核\week3\image\OLED代码.png")


### 注1
#### 本次实验使用的是STM32最小系统板与USB转TTL模块（并未使用教程中的STlink）。
# 
#### USB 转 TTL 模块的作用就是把电平转换到双方都能识别进行通信
单片机通信接口的电平逻辑和 PC 机通信接口的电平逻辑不同，PC 机上的通信 接口有 USB 接口，相应电平逻辑遵照 USB 原则；还有 DB9 接口(九针口)，相应电平逻辑遵照 RS-232 原则
单片机上的串行通信通过单片机的 RXD、TXD、VCC、GND 四个引脚，相应电平逻辑遵照 TTL 原则
USB 是一种串口(串口是一大类接口，包括但不仅限于 RS232)，它拥有复杂的通讯协议，支持热插拔，并可以以非常快的速度传输数据。串口，是指 RS232 串口，这是一种几乎没有协议的传输接口，可以直接收发数据

#### 工作原理

USB 转串口即实现计算机 USB 接口到物理串口之间的转换。可以为没有串口的计算机或其他 USB 主机增加串口，使用 USB 转串口设备等于将传统的串口设备变成了即插即用的 USB 设备

串口发送：
串口应用发送数据 -> USB 串口驱动获取数据 -> 驱动将数据经过 USB 通道发送给 USB 串口设备 -> USB 串口设备接收到数据通过串口发送

串口接收：
USB 串口设备接收串口数据 -> 将串口数据经过 USB 打包后上传给 USB 主机 -> USB 串口驱动获取到通过 USB 上传的串口数据 -> 驱动将数据保存在串口缓冲区提供给串口应用读取

#### 使用方法

![USB-TTL]("C:\Users\Young\Desktop\空队考核\week3\image\USB-TTL.jpg")

将该模块的5V接口与VCC接口相连，3.3V与GND接口与STM32最小系统板对应的3.3V与GND接口相连。TXD连接A10端口，RXD连接A9接口。

#



### 注2
由于使用了USB-TTL模块，所以采用FlyMcu烧录程序进行烧录。
![FlyMcu配置]("C:\Users\Young\Desktop\空队考核\week3\image\FlyMcu.jpg")

烧录时需要先把BOOT0接1，BOOT1接0.当下载完成后，再将BOOT0接回0，手动按下复位键即可显示结果。
#

### 注3
效果视频放在Vedio文件夹下。

