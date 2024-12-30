import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final Timestamp timestamp;
  const CustomChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: isCurrentUser ? Colors.green : Colors.black,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          Text(
            DateFormat('h:mm a').format(
              timestamp.toDate().subtract(
                    const Duration(
                      hours: 24,
                    ),
                  ),
            ),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey.shade200,
            ),
          ),
        ],
      ),
    );
  }
}
