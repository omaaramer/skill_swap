import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      required this.bottomRightradius,
      required this.topLeftRadius,
      required this.bottomLeftRadius,
      required this.topRightRadius,
      this.onPressed});
  final String text;
  final double bottomRightradius,
      topLeftRadius,
      bottomLeftRadius,
      topRightRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
          padding: WidgetStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          ),
          backgroundColor: WidgetStateProperty.all<Color>(
            Colors.white.withOpacity(.1),
          ),
          shape: WidgetStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(topLeftRadius),
                bottomLeft: Radius.circular(bottomLeftRadius),
                topRight: Radius.circular(topRightRadius),
                bottomRight: Radius.circular(bottomRightradius),
              ),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ));
  }
}
