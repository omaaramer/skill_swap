import 'package:flutter/material.dart';
import 'package:skill_swap/core/widgets/custom_text_field.dart';

class CustomAuthForm extends StatelessWidget {
  const CustomAuthForm(
      {super.key,
      required this.emailcontroller,
      required this.passwordcontroller});
  final emailcontroller, passwordcontroller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const Text("Email",
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        AppTextFormField(
            controller: emailcontroller,
            suffixIcon: const Icon(Icons.email_outlined),
            hintText: "name@gmail.com ",
            labelText: "Email",
            validator: (val) {}),
        const SizedBox(height: 16),
        // const Text("Password",
        //     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        AppTextFormField(
          suffixIcon: const Icon(Icons.lock_outline),
          hintText: "*********",
          labelText: "Password",
          validator: (val) {},
          controller: passwordcontroller,
        ),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
              onPressed: () {}, child: const Text("Forgot Password?")),
        ),
      ],
    );
  }
}
