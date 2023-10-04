; Auto-generated. Do not edit!


(cl:in-package sub_cli-srv)


;//! \htmlinclude Number-request.msg.html

(cl:defclass <Number-request> (roslisp-msg-protocol:ros-message)
  ((number
    :reader number
    :initarg :number
    :type cl:float
    :initform 0.0))
)

(cl:defclass Number-request (<Number-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Number-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Number-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_cli-srv:<Number-request> is deprecated: use sub_cli-srv:Number-request instead.")))

(cl:ensure-generic-function 'number-val :lambda-list '(m))
(cl:defmethod number-val ((m <Number-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_cli-srv:number-val is deprecated.  Use sub_cli-srv:number instead.")
  (number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Number-request>) ostream)
  "Serializes a message object of type '<Number-request>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Number-request>) istream)
  "Deserializes a message object of type '<Number-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Number-request>)))
  "Returns string type for a service object of type '<Number-request>"
  "sub_cli/NumberRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Number-request)))
  "Returns string type for a service object of type 'Number-request"
  "sub_cli/NumberRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Number-request>)))
  "Returns md5sum for a message object of type '<Number-request>"
  "89ba4f2ce3e045af45888facdc421449")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Number-request)))
  "Returns md5sum for a message object of type 'Number-request"
  "89ba4f2ce3e045af45888facdc421449")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Number-request>)))
  "Returns full string definition for message of type '<Number-request>"
  (cl:format cl:nil "float64 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Number-request)))
  "Returns full string definition for message of type 'Number-request"
  (cl:format cl:nil "float64 number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Number-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Number-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Number-request
    (cl:cons ':number (number msg))
))
;//! \htmlinclude Number-response.msg.html

(cl:defclass <Number-response> (roslisp-msg-protocol:ros-message)
  ((answer
    :reader answer
    :initarg :answer
    :type cl:integer
    :initform 0))
)

(cl:defclass Number-response (<Number-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Number-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Number-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name sub_cli-srv:<Number-response> is deprecated: use sub_cli-srv:Number-response instead.")))

(cl:ensure-generic-function 'answer-val :lambda-list '(m))
(cl:defmethod answer-val ((m <Number-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader sub_cli-srv:answer-val is deprecated.  Use sub_cli-srv:answer instead.")
  (answer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Number-response>) ostream)
  "Serializes a message object of type '<Number-response>"
  (cl:let* ((signed (cl:slot-value msg 'answer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Number-response>) istream)
  "Deserializes a message object of type '<Number-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'answer) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Number-response>)))
  "Returns string type for a service object of type '<Number-response>"
  "sub_cli/NumberResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Number-response)))
  "Returns string type for a service object of type 'Number-response"
  "sub_cli/NumberResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Number-response>)))
  "Returns md5sum for a message object of type '<Number-response>"
  "89ba4f2ce3e045af45888facdc421449")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Number-response)))
  "Returns md5sum for a message object of type 'Number-response"
  "89ba4f2ce3e045af45888facdc421449")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Number-response>)))
  "Returns full string definition for message of type '<Number-response>"
  (cl:format cl:nil "int32 answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Number-response)))
  "Returns full string definition for message of type 'Number-response"
  (cl:format cl:nil "int32 answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Number-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Number-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Number-response
    (cl:cons ':answer (answer msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Number)))
  'Number-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Number)))
  'Number-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Number)))
  "Returns string type for a service object of type '<Number>"
  "sub_cli/Number")