import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/assets.dart';

class RegesterationWithAcounts extends StatelessWidget {
  const RegesterationWithAcounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIcon(
            image: Assets.imagesGoogleLogo,
            onTap: () {},
          ),
          CustomIcon(
            image: Assets.imagesFacebokLogo,
            onTap: () {},
          ),
          CustomIcon(
            image: Assets.imagesAppleLogo,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.image, this.onTap});
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: const ShapeDecoration(
          shape: CircleBorder(
            side: BorderSide(color: Color(0xFFF4E9FD), width: 1),
          ),
          color: Color(0xFFF4E9FD),
        ),
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
