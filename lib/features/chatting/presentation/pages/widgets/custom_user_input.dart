import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../lang/locale_keys.g.dart';
import '../../../../auth/presentation/pages/widgets/custom_text_form_field.dart';

class CustomUserInput extends StatelessWidget {
  final TextEditingController mesageController;
  final void Function()? onTap;
  const CustomUserInput({
    super.key,
    required this.mesageController,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Row(
        children: [
          Expanded(
            child: CustomTextFormField(
              hint: LocaleKeys.typeMessageTitle.tr(),
              controller: mesageController,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
              ),
              child: Image.asset(
                'assets/send11.png',
                width: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
