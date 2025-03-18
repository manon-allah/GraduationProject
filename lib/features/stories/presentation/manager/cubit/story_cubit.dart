import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/stories/domain/entities/story_entity.dart';
import 'package:instagram/features/stories/domain/repos/story_repo.dart';
import '../../../../storage/domain/repos/storage_repo.dart';

part 'story_state.dart';

class StoryCubit extends Cubit<StoryState> {
  final StoryRepository storyRepo;
  final StorageRepository storageRepo;
  StoryCubit({
    required this.storyRepo,
    required this.storageRepo,
  }) : super(StoryInitial());

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addStory({
    required String id,
    required String userId,
    required String userName,
    required String name,
    required String profileImageUrl,
    required DateTime datePublished,
    required List<String> imageUrls,
  }) async {
    try {
      emit(StoryLoading());
      final List<File> imageFiles =
          imageUrls.map((path) => File(path)).toList();
      List<String> images = await storageRepo.uploadStoriesImages(
        imageFiles,
        userId,
        'userStory',
        'stories',
      );

      final newStory = StoryEntity(
        id: id,
        userId: userId,
        userName: userName,
        name: name,
        storyImageUrl: images,
        datePublished: datePublished,
        profileImage: profileImageUrl,
      );
      storyRepo.addStory(newStory);

      getAllStories();
    } catch (e) {
      emit(StoryError('Error adding post: $e'));
    }
  }

  Future<void> getAllStories() async {
    try {
      emit(StoryLoading());
      final stories = await storyRepo.getAllStories();
      emit(StorySuccess(stories));
    } catch (e) {
      emit(StoryError('Error getting stories : $e'));
    }
  }

  Future<void> getUserStories({
    required String userId,
  }) async {
    try {
      emit(StoryLoading());
      final userStories = await storyRepo.getStoriesByUserId(userId);
      emit(StorySuccess(userStories));
    } catch (e) {
      emit(StoryError('Error getting stories : $e'));
    }
  }

  Future<void> deleteStory(String postId) async {
    try {
      await storyRepo.deleteStory(postId);
    } catch (e) {
      emit(StoryError('Error deleting stories : $e'));
    }
  }
}
