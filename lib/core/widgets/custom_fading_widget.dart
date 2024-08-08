import 'package:flutter/material.dart';

class CustomFadingWidget extends StatefulWidget {
  const CustomFadingWidget({super.key, required this.child});
  final Widget child;

  @override
  State<CustomFadingWidget> createState() => _CustomFadingWidgetState();
}

class _CustomFadingWidgetState extends State<CustomFadingWidget>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animatedContainer;

  @override
  void initState() {
    animatedContainer = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 800));
    animation = Tween(begin: 0.2, end: 0.8).animate(animatedContainer);
    animatedContainer.addListener(() {
      setState(() {});
    });
    animatedContainer.repeat(reverse: true);
    super.initState();
  }

  @override
  void dispose() {
    animatedContainer.dispose(); // Dispose the controller to prevent the error
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: animation.value,
      child: widget.child,
    );
  }
}
