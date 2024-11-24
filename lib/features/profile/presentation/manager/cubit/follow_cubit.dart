import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'follow_state.dart';

class FollowCubit extends Cubit<FollowState> {
  FollowCubit() : super(FollowInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  

  // follow user
  Future<void> followUser(
    String uIdUser,
    String followUid,
  ) async {
    try {
      DocumentSnapshot snap =
          await firestore.collection('users').doc(uIdUser).get();
      List following = (snap.data()! as dynamic)['following'];

      if (following.contains(followUid)) {
        await firestore.collection('users').doc(followUid).update({
          'flowers': FieldValue.arrayRemove([uIdUser])
        });
        await firestore.collection('users').doc(uIdUser).update({
          'following': FieldValue.arrayRemove([followUid])
        });
      } else {
        await firestore.collection('users').doc(followUid).update({
          'flowers': FieldValue.arrayUnion([uIdUser])
        });
        await firestore.collection('users').doc(uIdUser).update({
          'following': FieldValue.arrayUnion([followUid])
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
