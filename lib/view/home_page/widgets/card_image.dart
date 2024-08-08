import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skill_swap/core/widgets/custom_fading_widget.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.imageUrl, this.height});
  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: CachedNetworkImage(
        width: double.infinity,
        height: height,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        // placeholder: (context, url) {
        //   return CustomFadingWidget(
        //       child: Container(
        //     color: Colors.grey,
        //     width: double.infinity,
        //     height: height,
        //   ));
        // },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
