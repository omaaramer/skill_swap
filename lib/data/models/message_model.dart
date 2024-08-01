import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String message;
  final String senderId;
  final String receiverId;
  final Timestamp time;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.receiverId,
    required this.time,
  });

  factory MessageModel.fromMap(Map<dynamic, dynamic> map) {
    return MessageModel(
      message: map['message'],
      senderId: map['senderId'],
      receiverId: map['receiverId'],
      time: map['time'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderId': senderId,
      'receiverId': receiverId,
      'time': time,
    };
  }

  String get formattedTime {
    final dateTime = time.toDate();
    return DateFormat('yyyy-MM-dd HH:mm:ss').format(dateTime);
  }
}
