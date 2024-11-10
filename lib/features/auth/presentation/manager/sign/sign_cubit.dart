import 'package:bloc/bloc.dart';
import 'package:instagram/core/services/firebase_auth_service.dart';
import 'package:meta/meta.dart';

part 'sign_state.dart';

class SignCubit extends Cubit<SignState> {
  SignCubit() : super(SignInitial());

  // signup
  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    String res = await FirebaseAuthService().signUpUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (res != 'Create User Success') {
      emit(SignupFailure());
    } else {
      emit(SignupSuccess());
    }

    return res;
  }

  // login
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = await FirebaseAuthService().loginUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (res != 'Login Success') {
      emit(LoginFailure());
    } else {
      emit(LoginSuccess());
    }

    return res;
  }
}
