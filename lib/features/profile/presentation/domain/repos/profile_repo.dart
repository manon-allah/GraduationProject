import '../entities/profile_entity.dart';

abstract class ProfileRepositotry {
  Future<ProfileEntity?> getCurrentProfile(String uid);
  Future<void> updateCurrentProfile(ProfileEntity updateProfile);
  Future<void> toggleFollow(String currentUid, String followingUid);
}
