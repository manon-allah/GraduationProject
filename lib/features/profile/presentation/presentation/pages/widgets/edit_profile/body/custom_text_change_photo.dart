import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../lang/locale_keys.g.dart';
import '../../../../../domain/entities/profile_entity.dart';

class CustomTextChangePhoto extends StatelessWidget {
  final void Function()? pickImage;
  final ProfileEntity user;
  final PlatformFile? imagePicked;
  const CustomTextChangePhoto({
    super.key,
    required this.imagePicked,
    required this.user,
    required this.pickImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            height: 150,
            width: 150,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            clipBehavior: Clip.hardEdge,
            child: imagePicked != null
                ? Image.file(
                    File(imagePicked!.path!),
                    fit: BoxFit.cover,
                  )
                : CachedNetworkImage(
                    imageUrl: user.imageProfileUrl,
                    placeholder: (context, url) =>
                        const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(
                      Icons.person,
                      size: 70,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    imageBuilder: (context, imageProvider) => Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        TextButton(
          onPressed: pickImage,
          child: Text(
            LocaleKeys.changeProfilePhotoTitle.tr(),
            style: const TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
