;; Auto-generated. Do not edit!


(when (boundp 'sub_cli::Number)
  (if (not (find-package "SUB_CLI"))
    (make-package "SUB_CLI"))
  (shadow 'Number (find-package "SUB_CLI")))
(unless (find-package "SUB_CLI::NUMBER")
  (make-package "SUB_CLI::NUMBER"))
(unless (find-package "SUB_CLI::NUMBERREQUEST")
  (make-package "SUB_CLI::NUMBERREQUEST"))
(unless (find-package "SUB_CLI::NUMBERRESPONSE")
  (make-package "SUB_CLI::NUMBERRESPONSE"))

(in-package "ROS")





(defclass sub_cli::NumberRequest
  :super ros::object
  :slots (_number ))

(defmethod sub_cli::NumberRequest
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

(defclass sub_cli::NumberResponse
  :super ros::object
  :slots (_answer ))

(defmethod sub_cli::NumberResponse
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

(defclass sub_cli::Number
  :super ros::object
  :slots ())

(setf (get sub_cli::Number :md5sum-) "89ba4f2ce3e045af45888facdc421449")
(setf (get sub_cli::Number :datatype-) "sub_cli/Number")
(setf (get sub_cli::Number :request) sub_cli::NumberRequest)
(setf (get sub_cli::Number :response) sub_cli::NumberResponse)

(defmethod sub_cli::NumberRequest
  (:response () (instance sub_cli::NumberResponse :init)))

(setf (get sub_cli::NumberRequest :md5sum-) "89ba4f2ce3e045af45888facdc421449")
(setf (get sub_cli::NumberRequest :datatype-) "sub_cli/NumberRequest")
(setf (get sub_cli::NumberRequest :definition-)
      "float64 number
---
int32 answer

")

(setf (get sub_cli::NumberResponse :md5sum-) "89ba4f2ce3e045af45888facdc421449")
(setf (get sub_cli::NumberResponse :datatype-) "sub_cli/NumberResponse")
(setf (get sub_cli::NumberResponse :definition-)
      "float64 number
---
int32 answer

")



(provide :sub_cli/Number "89ba4f2ce3e045af45888facdc421449")


