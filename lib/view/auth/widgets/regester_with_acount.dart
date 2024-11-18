import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/sign_in_with_google.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';

class RegesterationWithAcounts extends StatelessWidget {
  const RegesterationWithAcounts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SignInWithGoogleControllerImpl signInWithGoogleController =
        Get.put(SignInWithGoogleControllerImpl());
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomIcon(
            image: Assets.imagesGoogleLogo,
            onTap: () {
              signInWithGoogleController.signInWithGoogle();
            },
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
              // side: BorderSide(color: AppColors.secondary, width: 1),
              ),
          color: AppColors.background,
        ),
        child: Center(
          child: Image.asset(image),
        ),
      ),
    );
  }
}
