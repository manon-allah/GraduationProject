
import 'package:flutter/material.dart';

class CustomAllComments extends StatelessWidget {
  const CustomAllComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: InkWell(
        onTap: () {},
        child: const Text(
          'View all 16 comments',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
