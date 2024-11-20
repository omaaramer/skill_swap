import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/generated/l10n.dart';

import 'custom_dotted_border.dart';

class CustomUploadWidget extends StatelessWidget {
  const CustomUploadWidget({
    super.key,
    required this.url,
    required this.onPressed,
  });
  final void Function() onPressed;
  final String? url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(
          left: (20),
          top: (15),
          right: (20),
          bottom: (40),
        ),
        child: Column(
          children: [
            Text(
              S.of(context).chooseImage,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: (15)),
            CustomDottedBorder(
              imageUrl: url,
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
