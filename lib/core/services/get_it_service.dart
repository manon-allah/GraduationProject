import 'package:get_it/get_it.dart';
import 'package:instagram/core/services/firebase_auth_service.dart';
import 'package:instagram/features/auth/data/repos/auth_repo_imp.dart';
import 'package:instagram/features/auth/domain/repos/auth_repo.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService(),);
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
