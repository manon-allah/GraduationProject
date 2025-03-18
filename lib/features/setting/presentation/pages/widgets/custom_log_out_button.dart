import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/presentation/pages/auth_page.dart';
import '../../../../../lang/locale_keys.g.dart';
import '../../../../auth/presentation/manager/cubit/auth_cubit.dart';

class CustomLogOutButton extends StatefulWidget {
  const CustomLogOutButton({super.key});

  @override
  State<CustomLogOutButton> createState() => _CustomLogOutButtonState();
}

class _CustomLogOutButtonState extends State<CustomLogOutButton> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const AuthPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 30,
              height: 50,
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  await context.read<AuthCubit>().logOut();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.logout,
                      color: Colors.white,
                      size: 25,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      LocaleKeys.logOutTitle.tr(),
                      style: const TextStyle(
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
