import cv2
import numpy as np
import torch
from models.experimental import attempt_load
from utils.general import non_max_suppression, scale_coords
from utils.torch_utils import select_device, time_synchronized

# 定义RTSP URL
rtsp_url = 'rtsp://172.21.121.52/test'

# 初始化摄像头
cap = cv2.VideoCapture(rtsp_url)
assert cap.isOpened(), 'Cannot connect to RTSP'

# 定义模型路径和参数
weights = 'yolov5s.pt'
conf_thres = 0.25
iou_thres = 0.45

# 初始化yolov5模型
device = select_device('')
model = attempt_load(weights, map_location=device)
model.to(device).eval()

while cap.isOpened():
    ret, frame = cap.read()
    if not ret:
        break

    # 复制当前帧
    img0 = frame.copy()

    # 进行图像处理和推理
    img = torch.from_numpy(img0).to(device)
    img = img.float() / 255.0  # 归一化像素值到0-1之间
    if img.ndimension() == 3:
        img = img.unsqueeze(0)

    # 进行模型推理
    pred = model(img)[0]
    pred = non_max_suppression(pred, conf_thres, iou_thres)

    for det in pred:
        if len(det):
            det[:, :4] = scale_coords(img.shape[2:], det[:, :4], img0.shape).round()

            for *xyxy, conf, cls in reversed(det):
                # 处理每个检测框
                label = f'{cls} {conf:.2f}'
                plot_one_box(xyxy, img0, label=label, color=(0, 255, 0), line_thickness=3)

    # 显示结果图像
    cv2.imshow('result', img0)
    if cv2.waitKey(1) == ord('q'):
        break

# 释放资源
cap.release()
cv2.destroyAllWindows()
