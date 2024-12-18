import 'package:flutter/material.dart';

import 'log_in_page.dart';
import 'sign_up_page.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isLogin = true;

  void togglePages(){
    setState(() {
      isLogin = !isLogin;
    });
  }
  @override
  Widget build(BuildContext context) {
    if(isLogin){
      return LogInPage(togglePages: togglePages,);
    }else{
      return SignUpPage(togglePages: togglePages,);
    }
  }
}