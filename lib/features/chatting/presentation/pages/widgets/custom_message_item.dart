import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/chatting/presentation/pages/widgets/custom_chat_bubble.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';

class CustomMessageItem extends StatelessWidget {
  final Map<String, dynamic> userData;
  final DocumentSnapshot doc;
  const CustomMessageItem({
    super.key,
    required this.doc,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    late final authCubit = context.read<AuthCubit>();
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == authCubit.currentUser!.uid;
    var alignment =
        isCurrentUser ? Alignment.centerRight : Alignment.centerLeft;
    var mainAxisAlignment =
        isCurrentUser ? MainAxisAlignment.end : MainAxisAlignment.start;
    return Container(
      alignment: alignment,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          bottom: 5,
        ),
        child: Row(
          mainAxisAlignment: mainAxisAlignment,
          children: [
            Row(
              children: [
                CustomChatBubble(
                  message: data['messageContent'],
                  timestamp: data['timestamp'],
                  isCurrentUser: isCurrentUser,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
