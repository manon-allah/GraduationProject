import 'package:go_router/go_router.dart';
import 'package:instagram/features/auth/presentation/screens/login_screen.dart';
import 'package:instagram/features/auth/presentation/screens/signup_screen.dart';

import '../../features/bottom_nav_bar/presentation/screens/navigate.dart';

abstract class AppRouter {
  static const kSignupScreen = 'signupScreen';
  static const kloginScreen = 'loginScreen';
  static const kNavigationScreen = 'navigation';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: kloginScreen,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/signupScreen',
        name: kSignupScreen,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: '/navigation',
        name: kNavigationScreen,
        builder: (context, state) => const NavigateScreen(),
      ),
    ],
  );
}
