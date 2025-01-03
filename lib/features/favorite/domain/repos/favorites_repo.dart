import 'package:instagram/features/post/domain/entities/post_entity.dart';

abstract class FavoritesRepository {
  Future<void> addToFavorites(PostEntity post);
  Future<List<PostEntity>> getFavorites();
  Future<void> removeFromFavorites(PostEntity post);
}
