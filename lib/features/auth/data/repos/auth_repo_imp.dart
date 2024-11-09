import 'package:instagram/core/services/firebase_auth_service.dart';
import 'package:instagram/features/auth/data/models/user_model.dart';
import 'package:instagram/features/auth/domain/entities/user_entity.dart';
import 'package:instagram/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImp extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImp({required this.firebaseAuthService});
  @override
  Future<UserEntity> createUserWithEmailAndPassword(
      String email, String password , String name) async {
    var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email, password: password);
    return UserModel.fromFirebaseUser(user);
  }
}
