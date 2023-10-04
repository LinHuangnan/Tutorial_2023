;; Auto-generated. Do not edit!


(when (boundp 'week2test::Number)
  (if (not (find-package "WEEK2TEST"))
    (make-package "WEEK2TEST"))
  (shadow 'Number (find-package "WEEK2TEST")))
(unless (find-package "WEEK2TEST::NUMBER")
  (make-package "WEEK2TEST::NUMBER"))
(unless (find-package "WEEK2TEST::NUMBERREQUEST")
  (make-package "WEEK2TEST::NUMBERREQUEST"))
(unless (find-package "WEEK2TEST::NUMBERRESPONSE")
  (make-package "WEEK2TEST::NUMBERRESPONSE"))

(in-package "ROS")





(defclass week2test::NumberRequest
  :super ros::object
  :slots (_ask ))

(defmethod week2test::NumberRequest
  (:init
   (&key
    ((:ask __ask) 0.0)
    )
   (send-super :init)
   (setq _ask (float __ask))
   self)
  (:ask
   (&optional __ask)
   (if __ask (setq _ask __ask)) _ask)
  (:serialization-length
   ()
   (+
    ;; float64 _ask
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _ask
       (sys::poke _ask (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _ask
     (setq _ask (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass week2test::NumberResponse
  :super ros::object
  :slots (_answer ))

(defmethod week2test::NumberResponse
  (:init
   (&key
    ((:answer __answer) 0)
    )
   (send-super :init)
   (setq _answer (round __answer))
   self)
  (:answer
   (&optional __answer)
   (if __answer (setq _answer __answer)) _answer)
  (:serialization-length
   ()
   (+
    ;; int32 _answer
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _answer
       (write-long _answer s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _answer
     (setq _answer (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass week2test::Number
  :super ros::object
  :slots ())

(setf (get week2test::Number :md5sum-) "6dc919dc3dbcacc9c09896221084aee3")
(setf (get week2test::Number :datatype-) "week2test/Number")
(setf (get week2test::Number :request) week2test::NumberRequest)
(setf (get week2test::Number :response) week2test::NumberResponse)

(defmethod week2test::NumberRequest
  (:response () (instance week2test::NumberResponse :init)))

(setf (get week2test::NumberRequest :md5sum-) "6dc919dc3dbcacc9c09896221084aee3")
(setf (get week2test::NumberRequest :datatype-) "week2test/NumberRequest")
(setf (get week2test::NumberRequest :definition-)
      "float64 ask
---
int32 answer
")

(setf (get week2test::NumberResponse :md5sum-) "6dc919dc3dbcacc9c09896221084aee3")
(setf (get week2test::NumberResponse :datatype-) "week2test/NumberResponse")
(setf (get week2test::NumberResponse :definition-)
      "float64 ask
---
int32 answer
")



(provide :week2test/Number "6dc919dc3dbcacc9c09896221084aee3")


