// Auto-generated. Do not edit!

// (in-package week2test.srv)


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
      this.ask = null;
    }
    else {
      if (initObj.hasOwnProperty('ask')) {
        this.ask = initObj.ask
      }
      else {
        this.ask = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NumberRequest
    // Serialize message field [ask]
    bufferOffset = _serializer.float64(obj.ask, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NumberRequest
    let len;
    let data = new NumberRequest(null);
    // Deserialize message field [ask]
    data.ask = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'week2test/NumberRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ddbe15febb103006edb58c3b0b204bed';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float64 ask
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NumberRequest(null);
    if (msg.ask !== undefined) {
      resolved.ask = msg.ask;
    }
    else {
      resolved.ask = 0.0
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
        this.answer = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NumberResponse
    // Serialize message field [answer]
    bufferOffset = _serializer.int32(obj.answer, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NumberResponse
    let len;
    let data = new NumberResponse(null);
    // Deserialize message field [answer]
    data.answer = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'week2test/NumberResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '470a19a3f8e6b2cdb8f4d6ac8875463a';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 answer
    
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
      resolved.answer = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: NumberRequest,
  Response: NumberResponse,
  md5sum() { return '6dc919dc3dbcacc9c09896221084aee3'; },
  datatype() { return 'week2test/Number'; }
};
