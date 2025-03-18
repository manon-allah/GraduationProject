import 'dart:io';

import 'package:flutter/material.dart';

class CustomGridViewPhotos extends StatelessWidget {
  const CustomGridViewPhotos({
    super.key,
    required this.imgs,
  });

  final List<String>? imgs;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 700,
        child: GridView.builder(
          itemCount: imgs!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
          ),
          itemBuilder: (context, index) {
            return Image.file(
              File(imgs![index]),
              fit: BoxFit.fill,
            );
          },
        ));
  }
}
