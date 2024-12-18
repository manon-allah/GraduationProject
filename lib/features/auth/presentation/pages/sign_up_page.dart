import 'package:flutter/material.dart';

import 'widgets/custom_sign_up_body.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? togglePages;
  const SignUpPage({super.key, this.togglePages,});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSignupBody(
        togglePages: widget.togglePages,
      ),
    );
  }
}