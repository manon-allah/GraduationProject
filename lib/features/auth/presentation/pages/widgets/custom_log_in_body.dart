import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/show_snake_bar.dart';
import '../../manager/cubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';

class CustomLogInBody extends StatefulWidget {
  final void Function()? togglePages;
  const CustomLogInBody({
    super.key,
    required this.togglePages,
  });

  @override
  State<CustomLogInBody> createState() => _CustomLogInBodyState();
}

class _CustomLogInBodyState extends State<CustomLogInBody> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 281,
              ),
              Image.asset(
                'assets/instatextw-removebg-preview.png',
                width: 244,
                height: 68,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                height: 21,
              ),
              CustomTextFormField(
                controller: emailController,
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
                obscureText: false,
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
              CustomButton(
                text: 'Login',
                onTap: login,
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextHaveAccount(
                firstText: 'Do not have an email?',
                lastText: 'Register',
                onTap: widget.togglePages,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void login() {
    final String email = emailController.text;
    final String password = passwordController.text;

    final authCubit = context.read<AuthCubit>();

    if (email.isNotEmpty && password.isNotEmpty) {
      authCubit.logIn(email, password);
    } else {
      showSnackbar('Please enter both email and password', context);
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
