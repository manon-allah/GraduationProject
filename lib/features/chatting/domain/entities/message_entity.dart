import 'package:cloud_firestore/cloud_firestore.dart';

class MessageEntity {
  final String senderId;
  final String senderEmail;
  final String receiverId;
  final String messageContent;
  final Timestamp timestamp;

  MessageEntity({
    required this.senderId,
    required this.senderEmail,
    required this.receiverId,
    required this.messageContent,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'senderId': senderId,
      'senderEmail': senderEmail,
      'receiverId': receiverId,
      'messageContent': messageContent,
      'timestamp': timestamp,
    };
  }
}
