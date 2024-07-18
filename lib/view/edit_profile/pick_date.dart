import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/pick_date_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/app_style.dart';
import 'package:skill_swap/core/widgets/custom_buttom.dart';

class PickDate extends StatelessWidget {
  const PickDate({super.key});

  @override
  Widget build(BuildContext context) {
    PickDateControllerImpl pickDateController =
        Get.put(PickDateControllerImpl());
    return SafeArea(
        child: Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text("Date of Birth", style: AppStyle.styleBold26(context)),
              const SizedBox(height: 10),
              Text(
                "Enter your date of birth for better skill matching and personalized recommendations.",
                textAlign: TextAlign.center,
                style: AppStyle.styleRegular16Grey(context),
              ),
              const Spacer(),
              SizedBox(
                height: 200,
                child: CupertinoDatePicker(
                  mode: CupertinoDatePickerMode.date,
                  initialDateTime: DateTime(2000, 1, 1),
                  onDateTimeChanged: pickDateController.updateDate,
                ),
              ),
              const Spacer(),
              GetBuilder<PickDateControllerImpl>(
                  builder: (_) => Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 5),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            color: Color(0xffeee8f0)),
                        child: Text(
                            "${pickDateController.date.toLocal()}"
                                .split(' ')[0],
                            style: AppStyle.styleBold26(context)),
                      )),
              const SizedBox(height: 10),
              AppTextButton(
                  buttonText: "Select Date",
                  textStyle: AppStyle.stylerBold20(context),
                  onPressed: () {
                    // Get.toNamed(Routes.editProfile);
                  }),
            ],
          ),
        ),
      ),
    ));
  }
}
