import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/constants.dart';
import 'package:instagram/features/add_post/presentation/manager/cubit/post_cubit.dart';
import 'package:instagram/features/profile/presentation/manager/cubit/follow_cubit.dart';
import 'package:instagram/features/search/presentation/manager/cubit/search_cubit.dart';
import 'package:instagram/features/setting/presentation/manager/cubit/logout_cubit.dart';

import '../../core/utils/app_router.dart';
import '../auth/presentation/manager/sign/sign_cubit.dart';
import '../edit_profile/presentation/manager/cubit/add_user_data_cubit.dart';
import '../home/presentation/manager/home_cubit/home_cubit.dart';
import '../profile/presentation/manager/get_data/get_data_cubit.dart';
import '../setting/data/enums/theme_state.dart';
import '../setting/presentation/manager/switch/switch_cubit.dart';

class CustomMainScreen extends StatelessWidget {
  const CustomMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final token = cashing.getData(key: 'token');
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignCubit(),
        ),
        BlocProvider(
          create: (context) => AddUserDataCubit(),
        ),
        BlocProvider(
          create: (context) => GetDataCubit()..getRefreshData(),
        ),
        BlocProvider(
          create: (context) => PostCubit(),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => FollowCubit(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getPosts(currentUserId),
        ),
        BlocProvider(
          create: (context) => SwitchCubit()..changeTheme(ThemeState.initial),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          final router = GoRouter(
            initialLocation: token != null ? '/navigation' : '/',
            routes: AppRouter.routes,
          );
          final theme =
              state is SwitchLightTheme ? ThemeData.light() : ThemeData.dark();
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            theme: theme,
            title: 'Instagram App',
            routerConfig: router,
          );
        },
      ),
    );
  }
}
