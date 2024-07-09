import 'package:flutter/material.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';

class CustomAuthForm extends StatelessWidget {
  const CustomAuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Email",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        AppTextFormField(
            hintText: "name@gmail.com ",
            labelText: "Email",
            validator: (val) {}),
        const SizedBox(height: 16),
        const Text("Password",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        AppTextFormField(
            hintText: "*********", labelText: "Password", validator: (val) {}),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () {}, child: const Text("Forgot Password?")),
        ),
      ],
    );
  }
}
