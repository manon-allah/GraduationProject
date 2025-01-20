import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../storage/domain/repos/storage_repo.dart';
import '../../../domain/entities/post_entity.dart';
import '../../../domain/repos/post_repo.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final PostRepository postRepo;
  final StorageRepository storageRepo;

  PostCubit({
    required this.postRepo,
    required this.storageRepo,
  }) : super(PostInitial());

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> addPost({
    required String id,
    required String bio,
    required String userId,
    required String userName,
    required String profileImageUrl,
    required String description,
    required DateTime datePublished,
    required List<String> imageUrls,
  }) async {
    try {
      emit(PostsLoading());
      final List<File> imageFiles =
          imageUrls.map((path) => File(path)).toList();
      List<String> images = await storageRepo.uploadPostImages(
        imageFiles,
        userId,
        'userposts',
        'posts',
      );

      final newPost = PostEntity(
        id: id,
        userId: userId,
        description: description,
        userName: userName,
        postImageUrl: images,
        datePublished: datePublished,
        profileImageUrl: profileImageUrl,
        bio: bio,
        likes: [],
      );
      postRepo.addPost(newPost);

      getAllPosts();
    } catch (e) {
      emit(PostsError('Error adding post: $e'));
    }
  }

  Future<void> getAllPosts() async {
    try {
      emit(PostsLoading());
      final posts = await postRepo.getAllPosts();
      emit(PostsSuccess(posts));
    } catch (e) {
      emit(PostsError('Error getting posts: $e'));
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await postRepo.deletePost(postId);
    } catch (e) {
      emit(PostsError('Error deleting posts: $e'));
    }
  }

  Future<void> toggleLikePost(String postId, String userId) async {
    try {
      await postRepo.toggleLike(postId, userId);
    } catch (e) {
      emit(PostsError('Error toggling like: $e'));
    }
  }
}
