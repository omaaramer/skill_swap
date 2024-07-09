import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/assets.dart';

class RegesterationWithAcounts extends StatelessWidget {
  const RegesterationWithAcounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 64),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(Assets.imagesGoogleLogo),
          Image.asset(Assets.imagesFacebokLogo),
          Image.asset(Assets.imagesAppleLogo),
        ],
      ),
    );
  }
}
