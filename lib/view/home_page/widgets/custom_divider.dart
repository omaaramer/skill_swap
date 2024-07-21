import 'package:flutter/material.dart';

class CustomCardDivider extends StatelessWidget {
  const CustomCardDivider({super.key, this.endIndent, this.indent});
  final double? endIndent, indent;
  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      thickness: 1,
      endIndent: endIndent ?? 0,
      indent: indent ?? 0,
      height: 10,
    );
  }
}
