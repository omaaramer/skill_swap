import 'package:flutter/material.dart';
import 'package:skill_swap/core/helpers/extentions.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';

class HaveAcountWidget extends StatelessWidget {
  const HaveAcountWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Don't have an account?"),
        TextButton(
          onPressed: () {},
          child: TextButton(
            onPressed: () {
              context.pushNamed(Routes.signUpScreen);
            },
            child: Text(
              "Sign Up",
              style: AppStyle.styleBold26(context).copyWith(fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}
