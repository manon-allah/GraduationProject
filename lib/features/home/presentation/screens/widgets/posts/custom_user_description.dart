import 'package:flutter/material.dart';

class CustomUserNameDescription extends StatelessWidget {
  const CustomUserNameDescription({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
      ),
      child: Row(
        children: [
          Text(
            'UserName',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
