import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:instagram/features/profile/presentation/domain/entities/profile_entity.dart';

class CustomProfileCashedNetwork extends StatelessWidget {
  final ProfileEntity user;
  const CustomProfileCashedNetwork({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: user.imageProfileUrl,
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(
        Icons.person,
        size: 40,
        color: Theme.of(context).colorScheme.primary,
      ),
      imageBuilder: (context, imageProvider) => Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
