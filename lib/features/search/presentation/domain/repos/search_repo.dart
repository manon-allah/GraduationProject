import '../../../../profile/presentation/domain/entities/profile_entity.dart';

abstract class SearchRepository {
  Future<List<ProfileEntity?>> searchUser(String query);
}