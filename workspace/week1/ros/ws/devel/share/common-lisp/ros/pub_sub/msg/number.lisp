; Auto-generated. Do not edit!


(cl:in-package pub_sub-msg)


;//! \htmlinclude number.msg.html

(cl:defclass <number> (roslisp-msg-protocol:ros-message)
  ((number
    :reader number
    :initarg :number
    :type cl:float
    :initform 0.0))
)

(cl:defclass number (<number>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <number>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'number)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pub_sub-msg:<number> is deprecated: use pub_sub-msg:number instead.")))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <number>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pub_sub-msg:number-val is deprecated.  Use pub_sub-msg:number instead.")
  (number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <number>) ostream)
  "Serializes a message object of type '<number>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'number))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <number>) istream)
  "Deserializes a message object of type '<number>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'number) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<number>)))
  "Returns string type for a message object of type '<number>"
  "pub_sub/number")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'number)))
  "Returns string type for a message object of type 'number"
  "pub_sub/number")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<number>)))
  "Returns md5sum for a message object of type '<number>"
  "4dcebbc33e65171f948c63edad2d5dae")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'number)))
  "Returns md5sum for a message object of type 'number"
  "4dcebbc33e65171f948c63edad2d5dae")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<number>)))
  "Returns full string definition for message of type '<number>"
  (cl:format cl:nil "float64 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'number)))
  "Returns full string definition for message of type 'number"
  (cl:format cl:nil "float64 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <number>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <number>))
  "Converts a ROS message object to a list"
  (cl:list 'number
    (cl:cons ':number (number msg))
))
