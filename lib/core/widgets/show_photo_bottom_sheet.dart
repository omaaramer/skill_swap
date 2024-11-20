import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'pick_image_bottom_sheet.dart';

void showPhotoBottomSheet(
    {required BuildContext context,
    required dynamic Function(ImageSource) onTap}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(25.0),
      ),
    ),
    builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.28,
        maxChildSize: 0.4,
        minChildSize: 0.28,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: PickImageBottomSheet(
              onTap: onTap,
            ),
          );
        }),
  );
}
