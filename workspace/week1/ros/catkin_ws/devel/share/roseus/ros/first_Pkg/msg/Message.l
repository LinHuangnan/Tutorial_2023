;; Auto-generated. Do not edit!


(when (boundp 'first_Pkg::Message)
  (if (not (find-package "FIRST_PKG"))
    (make-package "FIRST_PKG"))
  (shadow 'Message (find-package "FIRST_PKG")))
(unless (find-package "FIRST_PKG::MESSAGE")
  (make-package "FIRST_PKG::MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude Message.msg.html


(defclass first_Pkg::Message
  :super ros::object
  :slots (_number ))

(defmethod first_Pkg::Message
  (:init
   (&key
    ((:number __number) 0)
    )
   (send-super :init)
   (setq _number (round __number))
   self)
  (:number
   (&optional __number)
   (if __number (setq _number __number)) _number)
  (:serialization-length
   ()
   (+
    ;; int32 _number
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _number
       (write-long _number s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _number
     (setq _number (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get first_Pkg::Message :md5sum-) "2474488a3908093ec1307bdd5b35815e")
(setf (get first_Pkg::Message :datatype-) "first_Pkg/Message")
(setf (get first_Pkg::Message :definition-)
      "int32 number
")



(provide :first_Pkg/Message "2474488a3908093ec1307bdd5b35815e")


