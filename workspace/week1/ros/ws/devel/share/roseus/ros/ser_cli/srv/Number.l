;; Auto-generated. Do not edit!


(when (boundp 'ser_cli::Number)
  (if (not (find-package "SER_CLI"))
    (make-package "SER_CLI"))
  (shadow 'Number (find-package "SER_CLI")))
(unless (find-package "SER_CLI::NUMBER")
  (make-package "SER_CLI::NUMBER"))
(unless (find-package "SER_CLI::NUMBERREQUEST")
  (make-package "SER_CLI::NUMBERREQUEST"))
(unless (find-package "SER_CLI::NUMBERRESPONSE")
  (make-package "SER_CLI::NUMBERRESPONSE"))

(in-package "ROS")





(defclass ser_cli::NumberRequest
  :super ros::object
  :slots (_random_Number ))

(defmethod ser_cli::NumberRequest
  (:init
   (&key
    ((:random_Number __random_Number) 0.0)
    )
   (send-super :init)
   (setq _random_Number (float __random_Number))
   self)
  (:random_Number
   (&optional __random_Number)
   (if __random_Number (setq _random_Number __random_Number)) _random_Number)
  (:serialization-length
   ()
   (+
    ;; float64 _random_Number
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _random_Number
       (sys::poke _random_Number (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _random_Number
     (setq _random_Number (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(defclass ser_cli::NumberResponse
  :super ros::object
  :slots (_answer ))

(defmethod ser_cli::NumberResponse
  (:init
   (&key
    ((:answer __answer) nil)
    )
   (send-super :init)
   (setq _answer __answer)
   self)
  (:answer
   (&optional __answer)
   (if __answer (setq _answer __answer)) _answer)
  (:serialization-length
   ()
   (+
    ;; bool _answer
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _answer
       (if _answer (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _answer
     (setq _answer (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass ser_cli::Number
  :super ros::object
  :slots ())

(setf (get ser_cli::Number :md5sum-) "afa02421f803f6ba8635e0239ef71de9")
(setf (get ser_cli::Number :datatype-) "ser_cli/Number")
(setf (get ser_cli::Number :request) ser_cli::NumberRequest)
(setf (get ser_cli::Number :response) ser_cli::NumberResponse)

(defmethod ser_cli::NumberRequest
  (:response () (instance ser_cli::NumberResponse :init)))

(setf (get ser_cli::NumberRequest :md5sum-) "afa02421f803f6ba8635e0239ef71de9")
(setf (get ser_cli::NumberRequest :datatype-) "ser_cli/NumberRequest")
(setf (get ser_cli::NumberRequest :definition-)
      "float64 random_Number
---
bool answer

")

(setf (get ser_cli::NumberResponse :md5sum-) "afa02421f803f6ba8635e0239ef71de9")
(setf (get ser_cli::NumberResponse :datatype-) "ser_cli/NumberResponse")
(setf (get ser_cli::NumberResponse :definition-)
      "float64 random_Number
---
bool answer

")



(provide :ser_cli/Number "afa02421f803f6ba8635e0239ef71de9")


