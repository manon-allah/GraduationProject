
import '../entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> getAllPosts();
  Future<void> addPost(PostEntity post);
  Future<void> deletePost(String postId);
  Future<List<PostEntity>> getPostsByUserId(String userId);
  Future<void> toggleLike(String postId, String userId);
}
