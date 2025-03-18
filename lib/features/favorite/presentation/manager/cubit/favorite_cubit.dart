import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../post/domain/entities/post_entity.dart';
import '../../../domain/repos/favorites_repo.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoritesRepository favoriteRepo;
  FavoriteCubit({required this.favoriteRepo}) : super(FavoriteInitial());

  List<PostEntity> favoritePosts = [];

  Future<void> addToFavorites(PostEntity post) async {
    emit(FavoritesLoading());
    try {
      await favoriteRepo.addToFavorites(post);
      await loadFavorites();
    } catch (e) {
      emit(FavoritesError("Failed to add to favorites"));
    }
  }

  Future<void> removeFromFavorites(PostEntity post) async {
    emit(FavoritesLoading());
    try {
      final query = await favoriteRepo.getFavorites();
      final postToRemove = query.firstWhere((p) => p.id == post.id);
      await favoriteRepo.removeFromFavorites(postToRemove);
      await loadFavorites();
    } catch (e) {
      emit(FavoritesError("Failed to remove from favorites"));
    }
  }

  Future<void> loadFavorites() async {
    emit(FavoritesLoading());
    try {
      favoritePosts = await favoriteRepo.getFavorites();
      emit(FavoritesLoaded(favoritePosts));
    } catch (e) {
      emit(FavoritesError("Failed to load favorites"));
    }
  }

  bool isFavorite(PostEntity post) {
    return favoritePosts.any((favorite) => favorite.id == post.id);
  }
}
