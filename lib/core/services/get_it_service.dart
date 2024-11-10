import 'package:get_it/get_it.dart';
import 'package:instagram/core/services/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService(),);
}
