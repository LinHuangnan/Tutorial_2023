### 工程说明

#### 文件夹说明
+ ```build文件夹``` 没有上传，储存编译相关文件
+ ```resource文件夹``` 存储相关资源
+ ```src文件夹``` 存储程序源码
+ ```lib文件夹``` 存储opencv源码
+ ```Recovery类``` 主要有三个函数，为```void readVideo(std::string filePath)```（读取视频路径，赋值到私有变量），```Mat process()```（处理目标视频，并返回处理后的图像），```void showResult(string name,Mat img)```（显示图像）;
+ ```Recovery```类的私有函数：```void color_store(Mat input_image)```将输入图像中的三个通道像素存入向量中；```void reverse(vector<vector<int>> vec, vector<int> &result)```输入视频中所有帧数的所有像素，该函数找出每个位置出现次数最多的像素并返回；```void color_change(Mat &input_image, vector<int> b, vector<int> g, vector<int> r)```根据输入的三通道像素重组背景