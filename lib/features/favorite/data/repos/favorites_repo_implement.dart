import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram/features/post/domain/entities/post_entity.dart';
import '../../domain/repos/favorites_repo.dart';

class FavoritesRepositoryImpl implements FavoritesRepository {
  
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addToFavorites(PostEntity post) async {
    await firestore.collection('favorites').add(post.toMap());
  }

  @override
  Future<List<PostEntity>> getFavorites() async {
    final querySnapshot = await firestore.collection('favorites').get();
    return querySnapshot.docs.map((doc) => PostEntity.fromMap(doc.data())).toList();
  }

  @override
  Future<void> removeFromFavorites(PostEntity post) async {
    final querySnapshot = await firestore
        .collection('favorites')
        .where('id', isEqualTo: post.id)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      await querySnapshot.docs.first.reference.delete();
    }
  }
}