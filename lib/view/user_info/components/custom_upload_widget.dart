import 'package:flutter/material.dart';

import 'custom_dotted_border.dart';

class CustomUploadWidget extends StatelessWidget {
  const CustomUploadWidget({
    super.key,
    required this.url,
    required this.onPressed,
    required this.onTap,
  });
  final void Function() onPressed;
  final String? url;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF4E9FD),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.only(
          left: (20),
          top: (15),
          right: (20),
          bottom: (40),
        ),
        child: Column(
          children: [
            const Text(
              'Upload image',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: (15)),
            CustomDottedBorder(
              imageUrl: url,
              onPressed: onPressed,
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}
