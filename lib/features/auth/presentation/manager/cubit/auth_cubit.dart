import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../profile/presentation/domain/repos/profile_repo.dart';
import '../../../domain/entities/user_entity.dart';
import '../../../domain/repos/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepo;
  ProfileRepositotry? profileRepo;
  UserEntity? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // check auth if the user is already authenticated
  void checkAuth() async {
    final UserEntity? user = await authRepo.getCurrentUser();
    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(UnAuthenticated());
    }
  }

  // get current user
  UserEntity? get currentUser => _currentUser;

  // log in
  Future<void> logIn(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.logInWithEmailAndPassword(email, password);
      if (user != null && profileRepo !=null) {
        _currentUser = user;
        await profileRepo!.getCurrentProfile(_currentUser!.uid);
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  // sign up
  Future<void> register(String email, String password) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(email, password);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(UnAuthenticated());
      }
    } catch (e) {
      emit(AuthError(e.toString()));
      emit(UnAuthenticated());
    }
  }

  // log out
  Future<void> logOut() async {
    authRepo.logOut();
    emit(UnAuthenticated());
  }
}
