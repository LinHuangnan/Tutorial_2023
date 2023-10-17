#include <opencv2/opencv.hpp>
#include <iostream>
#include <string>
#include "Recovery.h"
#include <conio.h>
#include <chrono>
using namespace cv;
using namespace std;
using namespace chrono;
int main(int argc, char *argv[])
{

    string filepath;
    Recovery recovery;
    Mat img;
    if (argc == 2)
    {
        filepath = argv[1];
        cout << "one \n";
        cout << "processing.....\n";
        recovery.readVideo(argv[1]);
        auto start = system_clock::now();
        img = recovery.process();
        auto end = system_clock::now();
        auto duration = duration_cast<microseconds>(end - start);
        cout << "spend "
             << double(duration.count()) * microseconds::period::num / microseconds::period::den
             << " seconds" << endl;
        recovery.showResult("result",img);
        getch();
    }
    else if (argc > 2)
    {
        cout << "too many\n";
    }
    else
    {
        cout << "none\n";
    }

    return 0;
}