import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/features/auth/presentation/screens/login_screen.dart';
import 'package:instagram/features/auth/presentation/screens/signup_screen.dart';
import 'package:instagram/features/edit_profile/presentation/screens/edit_profile.dart';
import 'package:instagram/features/profile/presentation/screens/profile_screen.dart';
import 'package:instagram/features/setting/presentation/screens/setting_screen.dart';

import '../../features/add_post/presentation/screens/add_post_screens.dart';
import '../../features/bottom_nav_bar/presentation/screens/navigate_screen.dart';
import '../../features/home/presentation/screens/comment_screen.dart';

abstract class AppRouter {
  static const kSignupScreen = 'signupScreen';
  static const kloginScreen = 'loginScreen';
  static const kNavigationScreen = 'navigation';
  static const kSettingsScreen = 'settingsScreen';
  static const kEditScreen = 'editScreen';
  static const kAddPostScreen = 'addPostScreen';
  static const kCommentScreen = 'commentScreen';
  static const kProfileScreen = 'profileScreen';

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
      GoRoute(
        path: '/settingsScreen',
        name: kSettingsScreen,
        builder: (context, state) => const SettingScreen(),
      ),
      GoRoute(
        path: '/editScreen',
        name: kEditScreen,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: '/addPostScreen',
        name: kAddPostScreen,
        builder: (context, state) => const AddPostScreens(),
      ),
      GoRoute(
        path: '/commentScreen',
        name: kCommentScreen,
        builder: (context, state) => const CommentScreen(),
      ),
      GoRoute(
        path: '/profileScreen',
        name: kProfileScreen,
        builder: (context, state) => ProfileScreen(
          uId: FirebaseAuth.instance.currentUser!.uid,
        ),
      ),
    ],
  );
}
