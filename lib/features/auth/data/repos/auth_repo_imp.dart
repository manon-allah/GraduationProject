import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repos/auth_repo.dart';

class AuthRepositoryImp implements AuthRepository {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<UserEntity?> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      // sign up
      UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create user
      UserEntity user = UserEntity(
        uid: userCredential.user!.uid,
        email: email,
        password: password,
      );
      await firebaseFirestore
          .collection('users')
          .doc(user.uid)
          .set(user.toMap());
      // return user
      return user;
    } catch (e) {
      throw Exception('Login Failed : $e');
    }
  }

  @override
  Future<UserEntity?> getCurrentUser() async {
    final user = firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return UserEntity(
      uid: user.uid,
      password: '',
      email: user.email!,
    );
  }

  @override
  Future<void> logOut() async {
    await firebaseAuth.signOut();
  }

  @override
  Future<UserEntity?> logInWithEmailAndPassword(
      String email, String password) async {
    try {
      // sign in
      UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      // create user
      UserEntity user = UserEntity(
        uid: userCredential.user!.uid,
        password: '',
        email: email,
      );
      // return user
      return user;
    } catch (e) {
      throw Exception('Login Failed : $e');
    }
  }
}
