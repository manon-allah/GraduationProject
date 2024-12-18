import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../storage/domain/repos/storage_repo.dart';
import '../../../domain/entities/profile_entity.dart';
import '../../../domain/repos/profile_repo.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepositotry profileRepo;
  final StorageRepository storageRepo;

  ProfileCubit({
    required this.profileRepo,
    required this.storageRepo,
  }) : super(ProfileInitial());

  Future<void> getCurrentProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.getCurrentProfile(uid);
      if (user != null) {
        emit(ProfileSuccess(user));
      } else {
        emit(ProfileError('User not found'));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<ProfileEntity?> getProfile(String uid) async {
    final user = await profileRepo.getCurrentProfile(uid);
    return user;
  }

  Future<void> updateProfile({
    required String uid,
    String? newBio,
    String? newPhone,
    String? newGender,
    String? newName,
    String? newUserName,
    String? newWebsite,
    String? imagePath,
  }) async {
    emit(ProfileLoading());
    try {
      // fetch current user
      final currentUser = await profileRepo.getCurrentProfile(uid);
      if (currentUser == null) {
        emit(ProfileError('Failed to fetch user to profile update'));
        return;
      }

      String? imageDownloadUrl;

      if (imagePath != null) {
        imageDownloadUrl = await storageRepo.uploadProfileImage(imagePath, uid);
      }

      if (imageDownloadUrl == null) {
        emit(ProfileError('Failed to upload profile image'));
        return;
      }

      // update profile
      final updatedProfile = currentUser.copyWith(
        newBio: newBio ?? currentUser.bio,
        newPhone: newPhone ?? currentUser.phone,
        newGender: newGender ?? currentUser.gender,
        newName: newName ?? currentUser.name,
        newUserName: newUserName ?? currentUser.userName,
        newWebsite: newWebsite ?? currentUser.website,
        newImageProfileUrl: imageDownloadUrl,
      );

      // update in repo
      await profileRepo.updateCurrentProfile(updatedProfile);

      // refetch updated profile
      await getCurrentProfile(uid);
    } catch (e) {
      emit(ProfileError('Failed to update profile: $e'));
    }
  }

  Future<void> toggleFollow(String currentUid, String followingUid) async {
    try {
      await profileRepo.toggleFollow(currentUid, followingUid);

    } catch (e) {
      emit(ProfileError('Failed to toggle follow: $e'));
    }
  }
}
