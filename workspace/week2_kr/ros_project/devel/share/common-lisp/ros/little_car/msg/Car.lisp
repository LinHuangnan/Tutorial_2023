; Auto-generated. Do not edit!


(cl:in-package little_car-msg)


;//! \htmlinclude Car.msg.html

(cl:defclass <Car> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:fixnum
    :initform 0)
   (y
    :reader y
    :initarg :y
    :type cl:fixnum
    :initform 0)
   (yaw
    :reader yaw
    :initarg :yaw
    :type cl:float
    :initform 0.0))
)

(cl:defclass Car (<Car>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Car>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Car)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name little_car-msg:<Car> is deprecated: use little_car-msg:Car instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Car>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader little_car-msg:x-val is deprecated.  Use little_car-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Car>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader little_car-msg:y-val is deprecated.  Use little_car-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'yaw-val :lambda-list '(m))
(cl:defmethod yaw-val ((m <Car>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader little_car-msg:yaw-val is deprecated.  Use little_car-msg:yaw instead.")
  (yaw m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Car>) ostream)
  "Serializes a message object of type '<Car>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'yaw))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Car>) istream)
  "Deserializes a message object of type '<Car>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'x)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'y)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'yaw) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Car>)))
  "Returns string type for a message object of type '<Car>"
  "little_car/Car")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Car)))
  "Returns string type for a message object of type 'Car"
  "little_car/Car")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Car>)))
  "Returns md5sum for a message object of type '<Car>"
  "cd68a8a366b933ecec7067b122a8e02d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Car)))
  "Returns md5sum for a message object of type 'Car"
  "cd68a8a366b933ecec7067b122a8e02d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Car>)))
  "Returns full string definition for message of type '<Car>"
  (cl:format cl:nil "uint8 x~%uint8 y~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Car)))
  "Returns full string definition for message of type 'Car"
  (cl:format cl:nil "uint8 x~%uint8 y~%float32 yaw~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Car>))
  (cl:+ 0
     1
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Car>))
  "Converts a ROS message object to a list"
  (cl:list 'Car
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':yaw (yaw msg))
))
