import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/core/services/get_it_service.dart';
import 'package:instagram/features/auth/domain/repos/auth_repo.dart';
import 'package:instagram/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:instagram/features/auth/presentation/screens/login_screen.dart';
import 'package:instagram/features/auth/presentation/screens/signup_screen.dart';
import 'package:instagram/features/edit_profile/presentation/screens/edit_profile.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/explore_screen.dart';
import 'package:instagram/features/home/presentation/screens/home_screen.dart';
import 'package:instagram/features/bottom_nav_bar/presentation/screens/navigate.dart';
import 'package:instagram/features/profile/presentation/screens/profile_screen.dart';
import 'package:instagram/features/search/presentation/screens/search_screen.dart';
import 'package:instagram/features/setting/data/enums/theme_state.dart';
import 'package:instagram/features/setting/presentation/manager/switch/switch_cubit.dart';

import 'package:instagram/firebase_options.dart';

import 'core/services/caching.dart';
import 'features/chatting/presentation/screens/chatting_screen.dart';
import 'features/setting/presentation/screens/setting_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await CacheHelper.cachIntialization();
  setupGetIt();
  runApp(const Instagram());
}

class Instagram extends StatelessWidget {
  const Instagram({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupCubit(
            getIt<AuthRepo>(),
          ),
        ),
        BlocProvider(
          create: (context) => SwitchCubit()..changeTheme(ThemeState.light),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          if (state is SwitchLightTheme) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              title: 'Instagram App',
              initialRoute: 'navigate',
              routes: {
                'sign_in': (context) => const LoginScreen(),
                'sign_up': (context) => const SignupScreen(),
                'home': (context) => const HomeScreen(),
                'profile': (context) => const ProfileScreen(),
                'explore': (context) => const ExploreScreen(),
                'search': (context) => const SearchScreen(),
                'navigate': (context) => const NavigateScreen(),
                'edit_profile': (context) => const EditProfile(),
                'setting': (context) => const SettingScreen(),
                'chatting': (context) => const ChattingScreen(),
              },
            );
          } else {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              title: 'Instagram App',
              initialRoute: 'navigate',
              routes: {
                'sign_in': (context) => const LoginScreen(),
                'sign_up': (context) => const SignupScreen(),
                'home': (context) => const HomeScreen(),
                'profile': (context) => const ProfileScreen(),
                'explore': (context) => const ExploreScreen(),
                'search': (context) => const SearchScreen(),
                'navigate': (context) => const NavigateScreen(),
                'edit_profile': (context) => const EditProfile(),
                'setting': (context) => const SettingScreen(),
                'chatting': (context) => const ChattingScreen(),
              },
            );
          }
        },
      ),
    );
  }
}
