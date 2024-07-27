import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageScreen extends StatelessWidget {
  final String? imageUrl;

  const ImageScreen({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Image Viewer')),
      body: SizedBox(
        height: 100,
        width: 100,
        child: Center(
          child: imageUrl == null
              ? const Text('No image available')
              : CachedNetworkImage(
                  imageUrl: imageUrl!,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
