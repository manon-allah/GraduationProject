import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/chatting/presentation/pages/widgets/custom_chat_bubble.dart';
import '../../../../auth/domain/entities/user_entity.dart';
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
    late UserEntity? currentUser = authCubit.currentUser;
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    bool isCurrentUser = data['senderId'] == currentUser!.uid;
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
            mainAxisAlignment == MainAxisAlignment.end
                ? Row(
                    children: [
                      CustomChatBubble(
                        message: data['messageContent'],
                        timestamp: data['timestamp'],
                        isCurrentUser: isCurrentUser,
                      ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: NetworkImage(
                      //     userData['imageProfileUrl'] ??
                      //         'https://img.freepik.com/free-photo/spring-scene-with-flowers-butterfly_23-2150169988.jpg',
                      //   ),
                      // ),
                    ],
                  )
                : Row(
                    children: [
                      // CircleAvatar(
                      //   radius: 20,
                      //   backgroundImage: NetworkImage(
                      //     userData['imageProfileUrl'] ??
                      //         'https://img.freepik.com/free-photo/spring-scene-with-flowers-butterfly_23-2150169988.jpg',
                      //   ),
                      // ),
                      // const SizedBox(
                      //   width: 10,
                      // ),
                      Text(
                        data['messageContent'],
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
