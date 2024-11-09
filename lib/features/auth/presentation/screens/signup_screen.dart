import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_signup_body.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: state is !SignupSuccess
              ? const CustomSignupBody()
              : const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
        );
      },
    );
  }
}
