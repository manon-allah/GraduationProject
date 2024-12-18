import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<UserEntity?> logInWithEmailAndPassword(String email, String password);
  Future<UserEntity?> registerWithEmailAndPassword(
      String email, String password);
  Future<void> logOut();
  Future<UserEntity?> getCurrentUser();
}
