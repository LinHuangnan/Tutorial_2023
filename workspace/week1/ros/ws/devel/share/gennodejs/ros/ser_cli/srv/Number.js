// Auto-generated. Do not edit!

// (in-package ser_cli.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class NumberRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.random_Number = null;
    }
    else {
      if (initObj.hasOwnProperty('random_Number')) {
        this.random_Number = initObj.random_Number
      }
      else {
        this.random_Number = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NumberRequest
    // Serialize message field [random_Number]
    bufferOffset = _serializer.float64(obj.random_Number, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NumberRequest
    let len;
    let data = new NumberRequest(null);
    // Deserialize message field [random_Number]
    data.random_Number = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ser_cli/NumberRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '624326930e08fe90db11591c270aef20';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 random_Number
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NumberRequest(null);
    if (msg.random_Number !== undefined) {
      resolved.random_Number = msg.random_Number;
    }
    else {
      resolved.random_Number = 0.0
    }

    return resolved;
    }
};

class NumberResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.answer = null;
    }
    else {
      if (initObj.hasOwnProperty('answer')) {
        this.answer = initObj.answer
      }
      else {
        this.answer = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NumberResponse
    // Serialize message field [answer]
    bufferOffset = _serializer.bool(obj.answer, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NumberResponse
    let len;
    let data = new NumberResponse(null);
    // Deserialize message field [answer]
    data.answer = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'ser_cli/NumberResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00a50c1bd863054691f197c515f4e922';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool answer
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NumberResponse(null);
    if (msg.answer !== undefined) {
      resolved.answer = msg.answer;
    }
    else {
      resolved.answer = false
    }

    return resolved;
    }
};

module.exports = {
  Request: NumberRequest,
  Response: NumberResponse,
  md5sum() { return 'afa02421f803f6ba8635e0239ef71de9'; },
  datatype() { return 'ser_cli/Number'; }
};
