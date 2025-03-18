import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/chatting/data/repos/chat_repo_imp.dart';
import 'package:instagram/features/chatting/presentation/manage/cubit/chat_cubit.dart';
import 'package:instagram/features/favorite/data/repos/favorites_repo_implement.dart';
import 'package:instagram/features/favorite/presentation/manager/cubit/favorite_cubit.dart';
import 'package:instagram/features/post/presentation/manager/cubit/post_cubit.dart';
import 'package:instagram/features/stories/data/repos/story_repo_imp.dart';
import 'package:instagram/features/stories/presentation/manager/cubit/story_cubit.dart';
import '../../core/functions/show_snake_bar.dart';
import '../../core/themes/cubit/theme_cubit.dart';
import '../../core/widgets/bottom_nav_bar.dart';
import '../auth/data/repos/auth_repo_imp.dart';
import '../auth/presentation/manager/cubit/auth_cubit.dart';
import '../auth/presentation/pages/auth_page.dart';
import '../home/presentation/manager/cubit/home_cubit.dart';
import '../post/data/repos/post_repo_imp.dart';
import '../profile/presentation/data/repos/profile_repo_imp.dart';
import '../profile/presentation/presentation/manager/cubit/profile_cubit.dart';
import '../search/presentation/data/repos/search_repo_imp.dart';
import '../search/presentation/presentation/cubit/search_cubit.dart';
import '../storage/data/repos/storage_repo_imp.dart';

class CustomMainScreen extends StatelessWidget {
  final authRepoImp = AuthRepositoryImp();
  final profileRepoImp = ProfileRepositotryImp();
  final postRepoImp = PostRepositoryImp();
  final storageRepoImp = StorageRepositoryImp();
  final searchRepoImp = SearchRepositoryImp();
  final chatRepoImp = ChatRepositoryImp();
  final favoriteRepoImp = FavoritesRepositoryImpl();
  final storyRepoImp = StoryRepositoryImp();

  CustomMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // auth cubit
        BlocProvider<AuthCubit>(
          create: (context) => AuthCubit(authRepo: authRepoImp)..checkAuth(),
        ),
        // profile cubit
        BlocProvider<ProfileCubit>(
          create: (context) => ProfileCubit(
            profileRepo: profileRepoImp,
            storageRepo: storageRepoImp,
          ),
        ),
        // post cubit
        BlocProvider<PostCubit>(
          create: (context) => PostCubit(
            postRepo: postRepoImp,
            storageRepo: storageRepoImp,
          ),
        ),
        // home cubit
        BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(
            postRepo: postRepoImp,
            profileRepo: profileRepoImp,
          ),
        ),
        // search cubit
        BlocProvider<SearchCubit>(
          create: (context) => SearchCubit(
            searchRepository: searchRepoImp,
          ),
        ),
        // chat cubit
        BlocProvider<ChatCubit>(
          create: (context) => ChatCubit(
            chatRepository: chatRepoImp,
          )..fetchUsers(),
        ),
        // favorite cubit
        BlocProvider<FavoriteCubit>(
          create: (context) => FavoriteCubit(
            favoriteRepo: favoriteRepoImp,
          ),
        ),
        // story cubit
        BlocProvider<StoryCubit>(
          create: (context) => StoryCubit(
            storyRepo: storyRepoImp,
            storageRepo: storageRepoImp,
          ),
        ),
        // theme cubit
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (context, currentTheme) {
          return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            theme: currentTheme,
            title: 'Instagram App',
            home: BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is AuthError) {
                  showSnackbar(state.message, context);
                }
              },
              builder: (context, state) {
                log('state is ================================= $state');
                if (state is UnAuthenticated) {
                  return const AuthPage();
                }
                if (state is Authenticated) {
                  return const BottomNavBar();
                } else {
                  return const Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
