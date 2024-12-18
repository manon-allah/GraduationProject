import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entities/post_entity.dart';
import '../../domain/repos/post_repo.dart';

class PostRepositoryImp implements PostRepository {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  final CollectionReference postCollection =
      FirebaseFirestore.instance.collection('posts');

  @override
  Future<void> addPost(PostEntity post) async {
    try {
      await postCollection.doc(post.id).set(post.toMap());
    } catch (e) {
      throw Exception('Error adding post: $e');
    }
  }

  @override
  Future<void> deletePost(String postId) async {
    await postCollection.doc(postId).delete();
  }

  @override
  Future<List<PostEntity>> getAllPosts() async {
    try {
      final postsSnapshot =
          await postCollection.orderBy('datePublished', descending: true).get();
      var allPosts = postsSnapshot.docs.map((doc) {
        return PostEntity.fromMap(doc.data() as Map<String,dynamic>);
      }).toList();
      return allPosts;
    } catch (e) {
      log(e.toString());
      throw Exception('Error getting post: $e');
    }
  }

  @override
  Future<List<PostEntity>> getPostsByUserId(String userId) async {
    try {
      final postsSnapshot =
          await postCollection.where('userId', isEqualTo: userId).get();

      final userPosts = postsSnapshot.docs
          .map((doc) => PostEntity.fromMap(doc.data() as Map<String, dynamic>))
          .toList();

      return userPosts;
    } catch (e) {
      throw Exception('Error getting post by user : $e');
    }
  }
  
  @override
  Future<void> toggleLike(String postId, String userId) async {
    try {
      final postDoc = await postCollection.doc(postId).get();
      if(postDoc.exists){
        final post = PostEntity.fromMap(postDoc.data() as Map<String, dynamic>);

        final hasLiked = post.likes.contains(userId);

        if(hasLiked){
          post.likes.remove(userId);
        }else{
          post.likes.add(userId);
        }

        await postCollection.doc(postId).update({
          'likes': post.likes,
        });
      }else{
        throw Exception('Post not found');
      }
    } catch (e) {
      throw Exception('Error toggling like: $e');
    }
  }



}
