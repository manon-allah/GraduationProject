import 'package:flutter/material.dart';

class CustomLogOutButton extends StatelessWidget {
  const CustomLogOutButton({super.key});

  @override
  Widget build(BuildContext context) {
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
              // await CacheHelper.deleteData(key: 'token');
              // print('Deleted token ===================>');
              // await logOutCubit.logOut();
              // showSnackbar('Logged Out', context);
              // GoRouter.of(context).pushReplacementNamed(AppRouter.kloginScreen);
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
  }
}
