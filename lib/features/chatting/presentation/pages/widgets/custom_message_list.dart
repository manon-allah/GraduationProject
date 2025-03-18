import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../auth/domain/entities/user_entity.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';
import '../../../domain/repos/chat_repo.dart';
import 'custom_message_item.dart';

class CustomMessageList extends StatelessWidget {
  final ChatRepository chatRepo;
  final String receiverId;
  final Map<String, dynamic> userData;
  const CustomMessageList({
    super.key,
    required this.chatRepo,
    required this.receiverId,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    late final authCubit = context.read<AuthCubit>();
    late UserEntity? currentUser = authCubit.currentUser;
    String senderId = currentUser!.uid;

    return StreamBuilder(
      stream: chatRepo.getMessages(receiverId, senderId),
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return const Text('Error');
        }
        if (snapShot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView(
          children: snapShot.data!.docs
              .map((doc) => CustomMessageItem(
                    userData: userData,
                    doc: doc,
                  ))
              .toList(),
        );
      },
    );
  }
}
