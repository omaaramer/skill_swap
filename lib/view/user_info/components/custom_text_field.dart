// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:skill_swap/core/theming/colores.dart';

class CustomTextFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool? isNumber;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  const CustomTextFormField({
    super.key,
    required this.hint,
    required this.icon,
    this.onChanged,
    this.mycontroller,
    this.validator,
    this.isNumber,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType:
          isNumber == true ? TextInputType.number : TextInputType.text,
      controller: mycontroller,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autofocus: false,
      validator: validator,
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.grey),
        icon: Container(
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
        // prefixIcon: Icon(Icons.person, size: 25, color: Colors.grey,),
        // contentPadding: EdgeInsets.only(left: 30),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
        enabled: true,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.lightBlack),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.black),
        ),
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.red),
        ),
      ),
    );
  }
}
