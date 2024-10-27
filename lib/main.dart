import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram/features/auth/presentation/screens/login_screen.dart';
import 'package:instagram/features/auth/presentation/screens/signup_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/explore_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/home_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/navigate.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/profile_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/search_screen.dart';

import 'package:instagram/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Instagram App',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: 'sign_in',
            routes: {
              'sign_in': (context) => const LoginScreen(),
              'sign_up': (context) => const SignupScreen(),
              'home': (context) => const HomeScreen(),
              'profile': (context) => const ProfileScreen(),
              'explore': (context) => const ExploreScreen(),
              'search': (context) => const SearchScreen(),
              'navigate': (context) => const NavigateScreen(),
            },
          );
        });
  }
}
