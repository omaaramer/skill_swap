import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/localization/is_arabic.dart';
import 'package:skill_swap/core/theming/colores.dart';

class AnimatedToggle extends StatelessWidget {
  final List<String> values;
  final ValueChanged<int> onToggleCallback;
  final Color? backgroundColor;
  final Color? buttonColor;
  final Color? textColor;

  AnimatedToggle({
    super.key,
    required this.values,
    required this.onToggleCallback,
    this.backgroundColor,
    this.buttonColor,
    this.textColor,
  });

  final RxBool initialPosition = true.obs;
  final bool isArabic =
      MyFunctions.isArabic(); // Use the function to check locale

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.65,
      height: Get.width * 0.1,
      margin: const EdgeInsets.all(20),
      child: Directionality(
        textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                initialPosition.value = !initialPosition.value;
                onToggleCallback(initialPosition.value ? 0 : 1);
              },
              child: Container(
                width: Get.width * 0.65,
                height: Get.width * 0.1,
                decoration: ShapeDecoration(
                  color: backgroundColor ?? AppColors.secondary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Get.width * 0.1),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(
                    values.length,
                    (index) => Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                      child: Text(
                        values[index],
                        style: TextStyle(
                          fontSize: Get.width * 0.04,
                          fontWeight: FontWeight.bold,
                          color: AppColors.lightBlack,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Obx(() => AnimatedAlign(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.decelerate,
                  alignment: initialPosition.value
                      ? (isArabic
                          ? Alignment.centerRight
                          : Alignment.centerLeft)
                      : (isArabic
                          ? Alignment.centerLeft
                          : Alignment.centerRight),
                  child: Container(
                    width: Get.width * 0.33,
                    height: Get.width * 0.1,
                    decoration: ShapeDecoration(
                      color: buttonColor ?? AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Get.width * 0.1),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      initialPosition.value ? values[0] : values[1],
                      style: TextStyle(
                        fontFamily: 'Cairo', // Font with Arabic support
                        fontSize: Get.width * 0.045,
                        color: textColor ?? AppColors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
