import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/presentation/manager/sign/sign_cubit.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_button_login_out.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_have_account.dart';

import '../../../../../core/functions/snack_bar_function.dart';

class CustomLoginBody extends StatefulWidget {
  const CustomLoginBody({super.key});

  @override
  State<CustomLoginBody> createState() => _CustomLoginBodyState();
}

class _CustomLoginBodyState extends State<CustomLoginBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignCubit, SignState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          showSnackbar('something wrong', context);
        } else {
          Navigator.pushReplacementNamed(context, 'navigate');
        }
      },
      builder: (context, state) {
        final loginCubit = context.read<SignCubit>();
        return Scaffold(
          body: state is !LoginSuccess
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 281,
                        ),
                        Image.asset(
                          'assets/login_out/instatextw.png',
                          width: 244,
                          height: 68,
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        CustomTextFormField(
                          controller: emailController,
                          hint: 'Email',
                          textInputType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomTextFormField(
                          obscureText: true,
                          controller: passwordController,
                          hint: 'password',
                          textInputType: TextInputType.visiblePassword,
                        ),
                        const SizedBox(
                          height: 92,
                        ),
                        CustomButtonLoginOut(
                          text: 'Login',
                          onTap: () {
                            loginCubit.loginUser(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                            // Navigator.pushReplacementNamed(context, 'navigate');
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        CustomTextHaveAccount(
                          firstText: 'Do not have an email?',
                          lastText: 'Register',
                          onTap: () {
                            Navigator.pushNamed(context, 'sign_up');
                          },
                        ),
                      ],
                    ),
                  ),
                )
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
