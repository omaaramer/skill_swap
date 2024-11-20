import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/generated/l10n.dart';

import 'custom_icon_button.dart';

class PickImageBottomSheet extends StatelessWidget {
  final Function(ImageSource source) onTap;
  const PickImageBottomSheet({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.grey.shade300,
      padding: const EdgeInsets.all(20),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: -35,
            child: Container(
              width: 50,
              height: 6,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.5),
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(children: [
            CustomIconButton(
              onTap: () => onTap(ImageSource.gallery),
              icon: Icons.image,
              textLabel: S.of(context).useGallery,
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                S.of(context).or,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CustomIconButton(
              onTap: () => onTap(ImageSource.camera),
              icon: Icons.camera_alt_outlined,
              textLabel: S.of(context).useCamera,
            ),
          ])
        ],
      ),
    );
  }
}
