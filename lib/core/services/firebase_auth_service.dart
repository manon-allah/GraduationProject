import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram/features/edit_profile/data/models/add_user_model.dart';

import '../../constants.dart';
import '../../features/auth/data/models/user_model.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // get data from firestore
  Future<AddUserModel> getUserData() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot documentSnapshot =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return AddUserModel.fromSnapshot(documentSnapshot);
  }

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
        log(userCredential.user!.uid);

        // add to model
        UserModel userModel = UserModel(
          uid: userCredential.user!.uid,
          email: email,
          password: password,
          name: '',
          userName: '',
          website: '',
          bio: '',
          phone: '',
          gender: '',
          imageUrl: '',
          followers: [],
          following: [],
        );
        // add user to firebase
        await _firestore
            .collection('users')
            .doc(userCredential.user!.uid)
            .set(userModel.toMap());
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
      String token = _auth.currentUser!.uid;
      print('token =====================>$token');
      cashing.setData(key: 'token', value: token);

      print('token from cache =============>${cashing.getData(key: 'token')}');
    } catch (e) {
      err = e.toString();
    }
    return err;
  }
}
