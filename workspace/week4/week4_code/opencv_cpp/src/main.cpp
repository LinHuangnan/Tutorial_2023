#include "Recovery.h"

int main(int argc, char* argv[]) {
    //
    if (argc != 2) {
        std::cout << "请提供视频文件的绝对路径作为命令行参数" << std::endl;
        return -1;
    }

    std::string filePath = argv[1];
    cv::Mat result;
    Recovery recovery;
    recovery.readVideo(filePath);
    recovery.process();


    return 0;
}
