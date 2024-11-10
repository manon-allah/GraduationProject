import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/presentation/manager/sign/sign_cubit.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_button_login_out.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_have_account.dart';

import '../../../../../core/functions/snack_bar_function.dart';

class CustomSignupBody extends StatefulWidget {
  const CustomSignupBody({super.key});

  @override
  State<CustomSignupBody> createState() => _CustomSignupBodyState();
}

class _CustomSignupBodyState extends State<CustomSignupBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
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
        if (state is SignupFailure) {
          showSnackbar('something wrong', context);
        }else{
          Navigator.pushNamed(context, 'sign_in');
        }
      },
      builder: (context, state) {
        final signupCubit = context.read<SignCubit>();
        return Scaffold(
          body: state is !SignupSuccess
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      autovalidateMode: autovalidateMode,
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
                            controller: passwordController,
                            obscureText: true,
                            hint: 'password',
                            textInputType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(
                            height: 92,
                          ),
                          CustomButtonLoginOut(
                            text: 'Signup',
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                signupCubit.createUser(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              } else {
                                setState(() {
                                  autovalidateMode = AutovalidateMode.always;
                                });
                              }
                            },
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          CustomTextHaveAccount(
                            firstText: 'Do you have an email?',
                            lastText: 'Login',
                            onTap: () {
                              Navigator.pushNamed(context, 'sign_in');
                            },
                          ),
                        ],
                      ),
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
