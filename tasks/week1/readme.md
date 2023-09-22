## 基础考核 - 第一周（9.23-10.1）



### 学习内容：

1. 安装 Linux 操作系统。
    - 我们建议不熟悉 Linux 系统的同学在虚拟机装系统，而不用双系统，避免损坏你的硬盘。如果对计算机体系和操作系统较熟悉，可以安装双系统。此外，若你的电脑运行win11系统，也可尝试使用 `wsl`。
2. 学习 Git，熟悉 GitHub 的使用
   - 参考考核仓库给出的教程[基于Git和Github完成考核](https://github.com/LinHuangnan/Tutorial_2023/blob/main/doc/%E5%9F%BA%E4%BA%8Egit%E5%92%8CGitHub%E5%AE%8C%E6%88%90%E8%80%83%E6%A0%B8%E4%BB%BB%E5%8A%A1.md)。
3. 学习 `makefile`和`cmake` 的使用。
4. 熟悉linux shell的使用。
   - 熟练掌握linux的基本命令
5. 安装`ros`；学习使用`ros`。

### 本周任务：

1. 在`Linux`环境下使用任何文本编辑工具编辑一个 C++ 程序，然后用 `cmake` 编译这个 C++ 程序, 输出 `Hello World`。请不要使用任何类型的 IDE。
2. 将整个工程提交到 GitHub 上。**在此工程中，请勿提交不重要的中间文件。**（如 `.o` 文件和编译的可执行文件。提示：使用 `.gitignore`）
3. 编写一个 package，其中包含一个信息发布节点 `Publisher`，和一个信息订阅节点 `Subscriber`。信息发布节点产生随机数据并发布，要求使用自己创建的自定义消息类型，信息订阅节点订阅话题并将数据输出到终端。
