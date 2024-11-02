import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.text,
  });

  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(),
              const SizedBox(
                width: 270,
                child: TextField(
                    // decoration: InputDecoration(
                    //   border: UnderlineInputBorder(
                    //     borderSide: BorderSide(
                    //       color: Colors.grey,
                    //     ),
                    //   ),
                    // ),
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
