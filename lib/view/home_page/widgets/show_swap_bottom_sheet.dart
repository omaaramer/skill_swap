import 'package:flutter/material.dart';
import 'package:skill_swap/data/models/post_model.dart';

import 'custom_bottom_sheet.dart';

void showSwapSkillBottomSheet(
    BuildContext context, Function(SkillModel) onSkillSelected) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.25,
          maxChildSize: 0.4,
          minChildSize: 0.25,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SwapSkillBottomSheet(
                onSkillSelected: onSkillSelected,
              ),
            );
          }));
}
