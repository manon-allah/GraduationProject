import 'package:flutter/material.dart';
import 'widgets/custom_chat_page_body.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomChatPageBody(),
    );
  }
}
