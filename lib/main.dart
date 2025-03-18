import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'core/services/caching.dart';
import 'core/services/firebase_api.dart';
import 'features/main_app/custom_main_screen.dart';
import 'lang/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  await CacheHelper.cachIntialization();
  await EasyLocalization.ensureInitialized();
  await initializeDateFormatting(); 
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/lang', // <-- change the path of the translation files 
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: const Instagram()
    ),
    );
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomMainScreen();
  }
}
