import 'package:flutter/material.dart';
import 'widgets/custom_log_in_body.dart';

class LogInPage extends StatefulWidget {
  final void Function()? togglePages;
  const LogInPage({
    super.key,
    this.togglePages,
  });

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomLogInBody(
        togglePages: widget.togglePages,
      ),
    );
  }
}
