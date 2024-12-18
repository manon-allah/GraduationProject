import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../post/domain/entities/post_entity.dart';
import '../../../../post/domain/repos/post_repo.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../../../profile/presentation/domain/repos/profile_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final ProfileRepositotry profileRepo;
  final PostRepository postRepo;
  HomeCubit({
    required this.postRepo,
    required this.profileRepo,
  }) : super(HomeInitial());

  Future<void> getData(String uid) async {
    try {
      emit(HomeLoading());
      final user = await profileRepo.getCurrentProfile(uid);
      log('user from cubit home is ======================= ${user!.following}');

      final posts = await postRepo.getAllPosts();
      log('posts from cubit home is ======================= ${posts.length}');

      final likes = posts.expand((post) => post.likes).toList();

      log('Likes list ============================= $likes');

      emit(HomeSuccess(
        likes,
        user,
        posts,
      ));
    } catch (e) {
      emit(HomeError('Error getting : $e'));
    }
  }
}
