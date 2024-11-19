import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData? icon;
  final int? maxLines;
  final String? initialValue;
  final bool isNumber;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;

  const CustomTextFormField({
    super.key,
    required this.hint,
    this.icon,
    this.initialValue,
    this.maxLines,
    this.onChanged,
    this.controller,
    this.validator,
    this.isNumber = false,
  }) : assert(initialValue == null || controller == null,
            'Cannot provide both initialValue and controller.');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: controller == null ? initialValue : null,
      onChanged: onChanged,
      minLines: 1,
      maxLines: maxLines ?? 1,
      keyboardType: isNumber
          ? TextInputType.number
          : (maxLines != null ? TextInputType.multiline : TextInputType.text),
      controller: controller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      validator: validator,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        icon: icon == null
            ? null
            : Container(
                height: 50,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(
                  icon,
                  color: AppColors.white,
                ),
              ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
        ),
        errorStyle: const TextStyle(color: AppColors.red, fontSize: 12),
      ),
    );
  }
}
