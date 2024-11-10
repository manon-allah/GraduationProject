import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/core/errors/exepsions.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signup
  Future<String> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        // signup user
        UserCredential userCredential =
            await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print(userCredential.user!.uid);

        // add user to firebase
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'password': password,
          'uId': userCredential.user!.uid,
          'followers': [],
          'following': [],
        });
        print('Create User Success');
      }
    } catch (e) {
      throw CustomException(message: 'something wrong');
    }
    throw CustomException(message: 'something wrong');
  }
}
