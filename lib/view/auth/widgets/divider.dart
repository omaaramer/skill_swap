import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Divider(
            height: 20,
            thickness: 1,
            color: Colors.grey,
          ),
        ),
        SizedBox(width: 10),
        Text("Or Continue With"),
        SizedBox(width: 10),
        Expanded(
          child: Divider(
            height: 20, // Adjusted height to match the first Divider
            thickness: 1,
            color: Colors.grey, // Changed color for visibility
          ),
        ),
      ],
    );
  }
}
