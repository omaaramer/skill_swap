import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.imageUrl, this.height});
  final String imageUrl;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: FutureBuilder<Image>(
        future: _loadImage(imageUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading image'));
          } else {
            return ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image(
                image: snapshot.data!.image,
                fit: BoxFit.cover,
              ),
            );
          }
        },
      ),
    );
  }
}

Future<Image> _loadImage(String url) async {
  final image = NetworkImage(url);
  await image.evict();
  return Image(image: image);
}
