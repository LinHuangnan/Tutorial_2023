;; Auto-generated. Do not edit!


(when (boundp 'little_car::Car)
  (if (not (find-package "LITTLE_CAR"))
    (make-package "LITTLE_CAR"))
  (shadow 'Car (find-package "LITTLE_CAR")))
(unless (find-package "LITTLE_CAR::CAR")
  (make-package "LITTLE_CAR::CAR"))

(in-package "ROS")
;;//! \htmlinclude Car.msg.html


(defclass little_car::Car
  :super ros::object
  :slots (_x _y _yaw ))

(defmethod little_car::Car
  (:init
   (&key
    ((:x __x) 0)
    ((:y __y) 0)
    ((:yaw __yaw) 0.0)
    )
   (send-super :init)
   (setq _x (round __x))
   (setq _y (round __y))
   (setq _yaw (float __yaw))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:yaw
   (&optional __yaw)
   (if __yaw (setq _yaw __yaw)) _yaw)
  (:serialization-length
   ()
   (+
    ;; uint8 _x
    1
    ;; uint8 _y
    1
    ;; float32 _yaw
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _x
       (write-byte _x s)
     ;; uint8 _y
       (write-byte _y s)
     ;; float32 _yaw
       (sys::poke _yaw (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _x
     (setq _x (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; uint8 _y
     (setq _y (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _yaw
     (setq _yaw (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get little_car::Car :md5sum-) "cd68a8a366b933ecec7067b122a8e02d")
(setf (get little_car::Car :datatype-) "little_car/Car")
(setf (get little_car::Car :definition-)
      "uint8 x
uint8 y
float32 yaw
")



(provide :little_car/Car "cd68a8a366b933ecec7067b122a8e02d")


