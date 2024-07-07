import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/assets.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';
import 'package:skill_swap/features/onBoarding/ui/onboarding_pageView.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.primary,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: 100,
                    child: AppTextButton(
                        borderRadius: 50,
                        backgroundColor: Colors.white.withOpacity(.1),
                        buttonText: "Back",
                        textStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                        onPressed: () {
                          context.pushNamed(Routes.onBoardingScrreen);
                        }),
                  ),
                ],
              ),
              SizedBox(
                height: 250,
                width: double.infinity,
                child: Center(
                  child: SvgPicture.asset(
                    Assets.imagesOnboarding1,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 40),
              const Text("Let’s  Get Started",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 50,
                      color: Colors.white)),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  "Unlock a world of limitless skills and knowledge with our free skill swapping app, where sharing is caring!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      height: 2,
                      color: Colors.white,
                      // fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      text: "LOG IN",
                      bottomRightradius: 8,
                      topLeftRadius: 8,
                      bottomLeftRadius: 8,
                      topRightRadius: 32,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomButton(
                      text: "SIGN UP",
                      bottomRightradius: 8,
                      topLeftRadius: 32,
                      bottomLeftRadius: 8,
                      topRightRadius: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.bottomRightradius,
      required this.topLeftRadius,
      required this.bottomLeftRadius,
      required this.topRightRadius});
  final String text;
  final double bottomRightradius,
      topLeftRadius,
      bottomLeftRadius,
      topRightRadius;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            Colors.white.withOpacity(.1),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius),
                bottomLeft: Radius.circular(bottomLeftRadius),
                topRight: Radius.circular(topRightRadius),
                bottomRight: Radius.circular(bottomRightradius),
              ),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ));
  }
}
