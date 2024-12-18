import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hint,
    this.textInputType,
    this.onSaved,
    this.controller,
    this.obscureText,
  });
  final String hint;
  final TextInputType? textInputType;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      obscureText: obscureText ?? false,
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required.';
        }
        return null;
      },
      onSaved: onSaved,
      keyboardType: textInputType,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.inversePrimary,
        ),
        filled: true,
        fillColor: Theme.of(context).colorScheme.primary,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
