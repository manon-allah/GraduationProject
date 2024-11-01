import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_signup_body.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomSignupBody(),
    );
  }
}