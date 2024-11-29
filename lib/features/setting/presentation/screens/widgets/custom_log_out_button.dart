import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram/core/functions/snack_bar_function.dart';
import 'package:instagram/features/setting/presentation/manager/log_out/logout_cubit.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/app_router.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutCubit, LogoutState>(
      builder: (context, state) {
        final logOutCubit = BlocProvider.of<LogoutCubit>(context);
        return Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 45,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await cashing.deleteData(key: 'token');
                  print('Deleted token ===================>');
                  await logOutCubit.logOut();
                  showSnackbar('Logged Out', context);
                  GoRouter.of(context)
                      .pushReplacementNamed(AppRouter.kloginScreen);
                },
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
