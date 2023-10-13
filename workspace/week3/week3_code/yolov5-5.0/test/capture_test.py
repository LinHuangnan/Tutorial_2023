import cv2

rtsp_url = "rtsp://127.0.0.1:554/test0"  # 替换为发布的RTSP视频流URL

# 创建视频捕获对象
cap = cv2.VideoCapture("rtsp://127.0.0.1:554/test0")

# 检查视频捕获对象是否成功打开
if not cap.isOpened():
    print("无法打开视频流")
    exit()

# 循环读取和显示视频帧
while True:
    # 读取视频帧
    ret, frame = cap.read()

    # 检查帧是否成功读取
    if not ret:
        print("无法读取视频帧")
        break

    # 在窗口中显示帧
    cv2.imshow("Video", frame)

    # 按下 'q' 键退出循环
    if cv2.waitKey(1) & 0xFF == ord('q'):
        break

# 释放资源
cap.release()
cv2.destroyAllWindows()