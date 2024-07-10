import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Auth/successsignup_controller.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class SuccessSignUpScreen extends StatelessWidget {
  const SuccessSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0.0,
        title: Text("Success", style: AppStyle.styleBold26(context)),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline,
            size: 200,
            color: AppColors.primary,
          )),
          Text("Congratulations", style: AppStyle.styleBold30(context)),
          Text("Your account has been created successfully"),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
                buttonText: "Continue",
                verticalPadding: 10,
                textStyle: const TextStyle(color: Colors.white, fontSize: 20),
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
