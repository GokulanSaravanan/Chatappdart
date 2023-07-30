import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Message {
  final String senderId;
  final String senderEmailId;
  final String receiverId;
  final String message;
  final Timestamp timestamp;

  Message(
      {required this.senderId,
      required this.senderEmailId,
      required this.receiverId,
      required this.message,
      required this.timestamp});
//convert to a map
  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmailId': senderEmailId,
      'receiverId': receiverId,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
