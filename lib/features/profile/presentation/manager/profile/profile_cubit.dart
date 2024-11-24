import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/constants.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getProfileData(String uIdUser) async {
    try {
      var userSnap = await FirebaseFirestore.instance
          .collection('users')
          .doc(uIdUser)
          .get();
      if (!userSnap.exists) {
        emit(ProfileFailure(message: 'User not found'));
      }
      var userData = userSnap.data()!;

      // post count
      var postSnap = await firestore
          .collection('posts')
          .where('uId', isEqualTo: uIdUser)
          .get();
      var postData = postSnap.docs;
      int postLength = postSnap.docs.length;

      // get followers and following
      int followers = userSnap['flowers'].length;
      int following = userSnap['following'].length;
      bool isFollowing = userSnap.data()!['flowers'].contains(currentUserId);

      emit(UserDataSuccess(
        userData: userData,
        posts: postData,
        postLength: postLength,
        followers: followers,
        following: following,
        isFollowing: isFollowing,
      ));
    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }

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
