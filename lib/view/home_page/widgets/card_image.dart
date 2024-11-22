import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.imageUrl, this.height});
  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: CachedNetworkImage(
        width: double.infinity,
        height: height,
        imageUrl: imageUrl,
        fit: BoxFit.cover,
        // placeholder: (context, url) => CustomFadingWidget(
        //   child: Container(
        //     width: double.infinity,
        //     height: height,
        //     decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(5), color: Colors.grey),
        //   ),
        // ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
