import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'add_user_data_state.dart';

class AddUserDataCubit extends Cubit<AddUserDataState> {
  AddUserDataCubit() : super(AddUserDataInitial());

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  Future<String> addUserData({
    required String name,
    required String userName,
    required String website,
    required String bio,
    required String email,
    required String phone,
    required String gender,
  }) async {
    String err = 'Something wrong!';
    try {
      if (name.isNotEmpty ||
          userName.isNotEmpty ||
          website.isNotEmpty ||
          bio.isNotEmpty ||
          email.isNotEmpty ||
          phone.isNotEmpty ||
          gender.isNotEmpty) {
        await firestore.collection('users').doc(auth.currentUser!.uid).set({
          'name': name,
          'userName': userName,
          'website': website,
          'bio': bio,
          'email': email,
          'phone': phone,
          'gender': gender,
        });
        err = 'Add User Success!';
        emit(AddUserDataSuccess());
      } else {
        err = 'Please enter all fields!';
      }
    } catch (e) {
      err = e.toString();
      emit(AddUserDataFailure());
    }
    return err;
  }
}
