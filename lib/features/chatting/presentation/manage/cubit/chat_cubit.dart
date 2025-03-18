import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepository chatRepository;
  ChatCubit({required this.chatRepository}) : super(ChatInitial());

  void fetchUsers() async {
    emit(ChatLoading());
    try {
      final usersStream = chatRepository.getUsersStream();
      usersStream.listen((users) {
        emit(ChatLoaded(users));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  void fetchMessages(String uId, String otherUid) async {
    emit(ChatLoading());
    try {
      final messagesStream = chatRepository.getMessages(uId, otherUid);
      messagesStream.listen((messages) {
        emit(MessagesLoaded(messages.docs
            .map((e) => e.data() as Map<String, dynamic>)
            .toList()));
      });
    } catch (e) {
      emit(ChatError(e.toString()));
    }
  }

  Future<void> sendMessage(String receiverId, String messageContent) async {
    try {
      emit(ChatLoading()); 
      await chatRepository.sendMessage(receiverId, messageContent); 
    } catch (e) {
      emit(ChatError(e.toString())); 
    }
  }
}
