#include<opencv2/opencv.hpp>
#include <iostream>
#include <string>
using namespace cv;
using namespace std;
int main()
{
    Mat img;
    string imgPath="D:\\vscode\\c++\\opencv_learn\\photo\\1.jpg";
    img=imread(imgPath,1);
    if(img.data==NULL)
    {
        puts("加载失败");
    }
    else
    {
        imshow("img",img);
    }
    waitKey(0);
    return 0;
}