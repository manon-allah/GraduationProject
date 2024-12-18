import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repos/profile_repo.dart';

class ProfileRepositotryImp implements ProfileRepositotry {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfileEntity?> getCurrentProfile(String uid) async {
    try {
      final userDoc =
          await firebaseFirestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {
          final followers = List<String>.from(userData['followers'] ?? []);
          final following = List<String>.from(userData['following'] ?? []);
          return ProfileEntity(
            uid: uid,
            email: userData['email'],
            password: userData['password'],
            bio: userData['bio'] ?? '',
            followers: followers,
            following: following,
            gender: userData['gender'] ?? '',
            imageProfileUrl: userData['imageProfileUrl']?.toString() ?? '',
            name: userData['name'] ?? '',
            phone: userData['phone'] ?? '',
            userName: userData['userName'] ?? '',
            website: userData['website'] ?? '',
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateCurrentProfile(ProfileEntity updateProfile) async {
    try {
      await firebaseFirestore
          .collection('users')
          .doc(updateProfile.uid)
          .update({
        'name': updateProfile.name,
        'userName': updateProfile.userName,
        'website': updateProfile.website,
        'bio': updateProfile.bio,
        'phone': updateProfile.phone,
        'gender': updateProfile.gender,
        'imageProfileUrl': updateProfile.imageProfileUrl
      });
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Future<void> toggleFollow(String currentUid, String followingUid) async {
    try {
      final currentUserDoc =
          await firebaseFirestore.collection('users').doc(currentUid).get();
      final followingUserDoc =
          await firebaseFirestore.collection('users').doc(followingUid).get();

      if (currentUserDoc.exists && followingUserDoc.exists) {
        final currentUserData = currentUserDoc.data();
        final followingUserData = followingUserDoc.data();

        if (currentUserData != null && followingUserData != null) {
          final List<String> currentFollowing =
              List<String>.from(currentUserData['following'] ?? []);

          if (currentFollowing.contains(followingUid)) {
            await firebaseFirestore.collection('users').doc(currentUid).update({
              'following': FieldValue.arrayRemove([followingUid])
            });

            await firebaseFirestore.collection('users').doc(followingUid).update({
              'followers': FieldValue.arrayRemove([currentUid])
            });

          } else {
            await firebaseFirestore.collection('users').doc(currentUid).update({
              'following': FieldValue.arrayUnion([followingUid])
            });

            await firebaseFirestore.collection('users').doc(followingUid).update({
              'followers': FieldValue.arrayUnion([currentUid])
            });

          }
        }
      }
    } catch (e) {}
  }
}
