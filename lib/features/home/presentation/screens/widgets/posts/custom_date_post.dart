
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePost extends StatelessWidget {
  const CustomDatePost({
    super.key,
    required this.snap,
  });

  final dynamic snap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
      ),
      child: Text(
        DateFormat.yMMMd().format(
          snap['datePublished'].toDate(),
        ),
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 17,
        ),
      ),
    );
  }
}
