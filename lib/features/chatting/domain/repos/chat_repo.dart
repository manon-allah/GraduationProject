import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatRepository {
  Stream<List<Map<String, dynamic>>> getUsersStream();
  Future<void> sendMessage(String receiverId, message);
  Stream<QuerySnapshot> getMessages(String uId, otherUid);
}
