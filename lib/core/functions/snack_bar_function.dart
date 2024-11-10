import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

showSnackbar(String message, BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
