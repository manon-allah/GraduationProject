import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/show_snake_bar.dart';
import '../../manager/cubit/auth_cubit.dart';
import 'custom_button.dart';
import 'custom_text.dart';
import 'custom_text_form_field.dart';

class CustomSignupBody extends StatefulWidget {
  final void Function()? togglePages;
  const CustomSignupBody({
    super.key,
    required this.togglePages,
  });

  @override
  State<CustomSignupBody> createState() => _CustomSignupBodyState();
}

class _CustomSignupBodyState extends State<CustomSignupBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
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
                  'assets/instatextw-removebg-preview.png',
                  width: 244,
                  height: 68,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                const SizedBox(
                  height: 21,
                ),
                CustomTextFormField(
                  obscureText: false,
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
                CustomButton(
                  text: 'Signup',
                  onTap: register,
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextHaveAccount(
                  firstText: 'Do you have an email?',
                  lastText: 'Login',
                  onTap: widget.togglePages,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      final String email = emailController.text;
      final String password = passwordController.text;

      final authCubit = context.read<AuthCubit>();

      if (email.isNotEmpty && password.isNotEmpty) {
        authCubit.register(email, password);
      } else {
        showSnackbar('Please enter both email and password', context);
      }
    } else {
      setState(() {
        autovalidateMode = AutovalidateMode.always;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }
}
