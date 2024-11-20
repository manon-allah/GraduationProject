import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/constants.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  FirebaseFirestore Firestore = FirebaseFirestore.instance;
  String currentUid = cashing.getData(key: 'token');

  getProfileData(String uId) async {
    try {
      var userSnap =
          await FirebaseFirestore.instance.collection('users').doc(uId).get();
      if (!userSnap.exists) {
        emit(ProfileFailure(message: 'User not found'));
      }
      var userData = userSnap.data();

      // post count
      var postSnap = await Firestore.collection('posts')
          .where('uId', isEqualTo: currentUid)
          .get();
      int postLength = postSnap.docs.length;

      // get followers and following
      int followers = userData!['flowers'].length;
      int following = userData['following'].length;
      bool isFollowing = userData['flowers'].contains(currentUid);

      emit(UserDataSuccess(
        userData: userData,
        postLength: postLength,
        followers: followers,
        following: following,
        isFollowing: isFollowing,
      ));
    } catch (e) {
      emit(ProfileFailure(message: e.toString()));
    }
  }
}
