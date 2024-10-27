import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/widgets/custom_button_login_out.dart';
import 'package:instagram/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:instagram/features/auth/presentation/widgets/custom_text_have_account.dart';

class CustomSignupBody extends StatelessWidget {
  const CustomSignupBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
              const CustomTextFormField(
                hint: 'Email',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 15,
              ),
              const CustomTextFormField(
                hint: 'password',
                textInputType: TextInputType.visiblePassword,
              ),
              const SizedBox(
                height: 92,
              ),
              CustomButtonLoginOut(
                text: 'Signup',
                onTap: () {},
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
    );
  }
}
