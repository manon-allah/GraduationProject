import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/firebase_options.dart';
import 'core/services/caching.dart';
import 'core/services/firebase_api.dart';
import 'features/main_app/custom_main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  await CacheHelper.cachIntialization();
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMainScreen();
  }
}
