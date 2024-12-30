import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/message_entity.dart';
import '../../domain/repos/chat_repo.dart';

class ChatRepoImp implements ChatRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return firestore.collection('users').snapshots().map((snapShot) {
      return snapShot.docs.map((doc) {
        final user = doc.data();
        return user;
      }).toList();
    });
  }

  @override
  Future<void> sendMessage(String receiverId, messageContent) async {
    final String currentUId = auth.currentUser!.uid;
    final String currentUEmail = auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    MessageEntity newMessage = MessageEntity(
      senderId: currentUId,
      senderEmail: currentUEmail,
      receiverId: receiverId,
      messageContent: messageContent,
      timestamp: timestamp,
    );

    List<String> ids = [currentUId, receiverId];
    ids.sort();
    String chatRoomId = ids.join('_');

    await firestore
        .collection('chat')
        .doc(chatRoomId)
        .collection('messages')
        .add(newMessage.toMap());
  }

  @override
  Stream<QuerySnapshot<Object?>> getMessages(String uId, otherUid) {
    List<String> ids = [uId, otherUid];
    ids.sort();
    String chatRoomId = ids.join('_');

    return firestore
        .collection('chat')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }
}
