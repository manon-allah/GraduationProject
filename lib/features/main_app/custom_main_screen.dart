import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_router.dart';
import '../auth/presentation/manager/sign/sign_cubit.dart';
import '../edit_profile/presentation/manager/cubit/add_user_data_cubit.dart';
import '../profile/presentation/manager/cubit/get_data_cubit.dart';
import '../setting/data/enums/theme_state.dart';
import '../setting/presentation/manager/switch/switch_cubit.dart';

class CustomMainScreen extends StatelessWidget {
  const CustomMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          create: (context) => SwitchCubit()..changeTheme(ThemeState.light),
        ),
      ],
      child: BlocBuilder<SwitchCubit, SwitchState>(
        builder: (context, state) {
          if (state is SwitchLightTheme) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.light(),
              title: 'Instagram App',
              routerConfig: AppRouter.router,
            );
          } else {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              title: 'Instagram App',
              routerConfig: AppRouter.router,
            );
          }
        },
      ),
    );
  }
}