import 'package:flutter/material.dart';
import '../../data/repos/chat_repo_imp.dart';
import '../../domain/repos/chat_repo.dart';
import 'widgets/custom_message_list.dart';
import 'widgets/custom_user_input.dart';

class ChatBody extends StatefulWidget {
  final Map<String, dynamic> userData;
  const ChatBody({
    super.key,
    required this.userData,
  });

  @override
  State<ChatBody> createState() => _ChatBodyState();
}

class _ChatBodyState extends State<ChatBody> {
  TextEditingController messageController = TextEditingController();
  final ChatRepository chatRepo = ChatRepoImp();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.userData['name'],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomMessageList(
              userData: widget.userData,
              receiverId: widget.userData['uid'],
              chatRepo: chatRepo,
            ),
          ),
          CustomUserInput(
            mesageController: messageController,
            onTap: sendMessages,
          ),
        ],
      ),
    );
  }

  void sendMessages() async {
    if (messageController.text.isNotEmpty) {
      await chatRepo.sendMessage(
        widget.userData['uid'],
        messageController.text,
      );

      messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }
}
