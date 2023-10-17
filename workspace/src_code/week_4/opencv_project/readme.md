### 工程说明

#### 文件夹说明
+ ```build文件夹``` 没有上传，储存编译相关文件
+ ```resource文件夹``` 存储相关资源
+ ```src文件夹``` 存储程序源码
+ ```lib文件夹``` 存储opencv源码
+ ```Recovery类``` 主要有三个函数，为```void readVideo(std::string filePath)```（读取视频路径，赋值到私有变量），```Mat process()```（处理目标视频，并返回处理后的图像），```void showResult(string name,Mat img)```（显示图像）