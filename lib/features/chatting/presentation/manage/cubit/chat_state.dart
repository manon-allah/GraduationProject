part of 'chat_cubit.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class ChatLoading extends ChatState {}

final class ChatLoaded extends ChatState {
  final List<Map<String, dynamic>> users;
  ChatLoaded(this.users);
}

final class MessagesLoaded extends ChatState {
  final List<Map<String, dynamic>> messages;
  MessagesLoaded(this.messages);
}

final class ChatError extends ChatState {
  final String error;
  ChatError(this.error);
}
