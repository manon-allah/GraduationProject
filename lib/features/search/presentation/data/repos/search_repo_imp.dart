import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../profile/presentation/domain/entities/profile_entity.dart';
import '../../domain/repos/search_repo.dart';

class SearchRepositoryImp implements SearchRepository {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<List<ProfileEntity?>> searchUser(String query) async {
    try {
      final res = await firestore
          .collection('users')
          .where('name', isGreaterThanOrEqualTo: query)
          .where('name', isLessThanOrEqualTo: '$query\uf8ff')
          .get();
      return res.docs.map((e) => ProfileEntity.fromMap(e.data())).toList();
    } catch (e) {
      throw Exception('Error searching user: $e');
    }
  }
}
