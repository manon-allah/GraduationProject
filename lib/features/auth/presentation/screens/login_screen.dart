import 'package:flutter/material.dart';
import 'package:instagram/features/auth/presentation/screens/widgets/custom_login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomLoginBody(),
    );
  }
}
