import 'package:bloc/bloc.dart';
import 'package:instagram/features/auth/domain/repos/auth_repo.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this.authRepo) : super(SignupInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String name) async {
    // final result =
    await authRepo.createUserWithEmailAndPassword(email, password, name);
    emit(SignupSuccess());
    // return result;
  }
}
