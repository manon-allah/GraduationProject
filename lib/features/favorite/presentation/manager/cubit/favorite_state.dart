part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}


class FavoritesLoading extends FavoriteState {}

class FavoritesLoaded extends FavoriteState {
  final List<PostEntity> favorites;

  FavoritesLoaded(this.favorites);
}

class FavoritesError extends FavoriteState {
  final String message;

  FavoritesError(this.message);
}