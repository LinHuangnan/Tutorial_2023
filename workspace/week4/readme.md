# 1.尝试还原各个video的背景图
代码见`workspace/week4/week4_code`

尝试的路径
一开始的时候尝试使用帧间差法，但效果不好
于是改用高斯混合模型，进行调试

以下是简要思路
1. 首先存储背景帧的灰度图像和彩色图像
2. 读取第一帧作为背景帧
3. 将背景帧转换为灰度图像

顺便获取获取视频的尺寸
4. 存储每个像素的背景模型参数：均值和标准差
5. 初始化背景模型参数
6. 计算处理函数开始时间

开始处理每一帧图像
7. 将当前帧转换为灰度图像
8. 遍历每个像素，根据高斯模型进行背景提取
9. 获取当前帧的像素值和背景模型参数
10. 计算当前帧像素值与背景模型的差异
11. 更新背景模型参数
12. 判断当前像素是否属于背景
13. 再次更新背景模型参数

处理提取后的结果
14. 创建一个彩色的图像，与原始帧的尺寸和颜色通道数相同
15. 将原始帧复制到彩色图像，保留彩色信息
16. 将灰度图像复制到彩色图像的一个颜色通道
17. 将处理后的灰度图像与原始彩色图像进行合并

最后显示背景还原后的彩色图像

以下是运行截图
## **`video1`**
![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/1.png)

![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/1.1.png)
## **`video2`**
![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/2.png)

![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/2.1.png)

## **`video3`**
![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/3.png)

![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/3.1.png)
# 2.使用makefile成功编译运行
![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/符合团队规范的目录结构.png)
![](https://github.com/skyswordx/Tutorial_2023/blob/main/workspace/week4/week4_asset/makefile.png)
# 3.输出了程序运行计时
见运行截图
