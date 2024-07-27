import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.65,
      height: Get.width * 0.1,
      margin: const EdgeInsets.all(20),
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
                color: backgroundColor ?? const Color(0xFFe7e7e8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(Get.width * 0.1),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
                    child: Text(
                      values[index],
                      style: TextStyle(
                        fontFamily: 'Rubik',
                        fontSize: Get.width * 0.04,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xAA000000),
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
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
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
                      fontFamily: 'Rubik',
                      fontSize: Get.width * 0.045,
                      color: textColor ?? Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
