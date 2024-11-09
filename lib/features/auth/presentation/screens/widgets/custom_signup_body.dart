import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/features/auth/presentation/manager/cubit/signup_cubit.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_button_login_out.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_form_field.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_text_have_account.dart';

class CustomSignupBody extends StatefulWidget {
  const CustomSignupBody({super.key});

  @override
  State<CustomSignupBody> createState() => _CustomSignupBodyState();
}

class _CustomSignupBodyState extends State<CustomSignupBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late String email, name, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
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
                  onSaved: (value) {
                    name = value!;
                  },
                  hint: 'Name',
                  textInputType: TextInputType.name,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    email = value!;
                  },
                  hint: 'Email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomTextFormField(
                  onSaved: (value) {
                    password = value!;
                  },
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
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            email,
                            password,
                            name,
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
      ),
    );
  }
}
