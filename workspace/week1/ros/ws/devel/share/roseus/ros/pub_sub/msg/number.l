;; Auto-generated. Do not edit!


(when (boundp 'pub_sub::number)
  (if (not (find-package "PUB_SUB"))
    (make-package "PUB_SUB"))
  (shadow 'number (find-package "PUB_SUB")))
(unless (find-package "PUB_SUB::NUMBER")
  (make-package "PUB_SUB::NUMBER"))

(in-package "ROS")
;;//! \htmlinclude number.msg.html


(defclass pub_sub::number
  :super ros::object
  :slots (_number ))

(defmethod pub_sub::number
  (:init
   (&key
    ((:number __number) 0.0)
    )
   (send-super :init)
   (setq _number (float __number))
   self)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; float64 _number
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _number
       (sys::poke _number (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _number
     (setq _number (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get pub_sub::number :md5sum-) "4dcebbc33e65171f948c63edad2d5dae")
(setf (get pub_sub::number :datatype-) "pub_sub/number")
(setf (get pub_sub::number :definition-)
      "float64 number

")



(provide :pub_sub/number "4dcebbc33e65171f948c63edad2d5dae")


