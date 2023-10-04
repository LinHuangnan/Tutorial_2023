; Auto-generated. Do not edit!


(cl:in-package ser_cli-srv)


;//! \htmlinclude Number-request.msg.html

(cl:defclass <Number-request> (roslisp-msg-protocol:ros-message)
  ((random_Number
    :reader random_Number
    :initarg :random_Number
    :type cl:float
    :initform 0.0))
)

(cl:defclass Number-request (<Number-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Number-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Number-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ser_cli-srv:<Number-request> is deprecated: use ser_cli-srv:Number-request instead.")))

(cl:ensure-generic-function 'random_Number-val :lambda-list '(m))
(cl:defmethod random_Number-val ((m <Number-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ser_cli-srv:random_Number-val is deprecated.  Use ser_cli-srv:random_Number instead.")
  (random_Number m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Number-request>) ostream)
  "Serializes a message object of type '<Number-request>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'random_Number))))
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
    (cl:setf (cl:slot-value msg 'random_Number) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Number-request>)))
  "Returns string type for a service object of type '<Number-request>"
  "ser_cli/NumberRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Number-request)))
  "Returns string type for a service object of type 'Number-request"
  "ser_cli/NumberRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Number-request>)))
  "Returns md5sum for a message object of type '<Number-request>"
  "afa02421f803f6ba8635e0239ef71de9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Number-request)))
  "Returns md5sum for a message object of type 'Number-request"
  "afa02421f803f6ba8635e0239ef71de9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Number-request>)))
  "Returns full string definition for message of type '<Number-request>"
  (cl:format cl:nil "float64 random_Number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Number-request)))
  "Returns full string definition for message of type 'Number-request"
  (cl:format cl:nil "float64 random_Number~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Number-request>))
  (cl:+ 0
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Number-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Number-request
    (cl:cons ':random_Number (random_Number msg))
))
;//! \htmlinclude Number-response.msg.html

(cl:defclass <Number-response> (roslisp-msg-protocol:ros-message)
  ((answer
    :reader answer
    :initarg :answer
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Number-response (<Number-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Number-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Number-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ser_cli-srv:<Number-response> is deprecated: use ser_cli-srv:Number-response instead.")))

(cl:ensure-generic-function 'answer-val :lambda-list '(m))
(cl:defmethod answer-val ((m <Number-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ser_cli-srv:answer-val is deprecated.  Use ser_cli-srv:answer instead.")
  (answer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Number-response>) ostream)
  "Serializes a message object of type '<Number-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'answer) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Number-response>) istream)
  "Deserializes a message object of type '<Number-response>"
    (cl:setf (cl:slot-value msg 'answer) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Number-response>)))
  "Returns string type for a service object of type '<Number-response>"
  "ser_cli/NumberResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Number-response)))
  "Returns string type for a service object of type 'Number-response"
  "ser_cli/NumberResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Number-response>)))
  "Returns md5sum for a message object of type '<Number-response>"
  "afa02421f803f6ba8635e0239ef71de9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Number-response)))
  "Returns md5sum for a message object of type 'Number-response"
  "afa02421f803f6ba8635e0239ef71de9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Number-response>)))
  "Returns full string definition for message of type '<Number-response>"
  (cl:format cl:nil "bool answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Number-response)))
  "Returns full string definition for message of type 'Number-response"
  (cl:format cl:nil "bool answer~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Number-response>))
  (cl:+ 0
     1
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
  "ser_cli/Number")