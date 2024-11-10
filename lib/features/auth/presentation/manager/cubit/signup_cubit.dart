import 'package:bloc/bloc.dart';
import 'package:instagram/core/services/firebase_auth_service.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

  Future<String> createUser({
    required String email,
    required String password,
  }) async {
    String res = await FirebaseAuthService().signUpUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    emit(SignupSuccess());
    return res;
  }
}
