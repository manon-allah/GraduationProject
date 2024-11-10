import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // signup
  Future<String> signUpUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String err = 'Something wrong';
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
        err = 'Create User Success';
      }
    } catch (e) {
      err = e.toString();
    }
    return err;
  }

  // login
  Future<String> loginUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    String err = 'Something wrong';
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        err = 'Login Success';
      } else {
        err = 'Please enter all fields';
      }
    } catch (e) {
      err = e.toString();
    }
    return err;
  }
}
