import 'package:flutter/material.dart';

class CustomCardImage extends StatelessWidget {
  const CustomCardImage({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
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
                borderRadius: BorderRadius.circular(15),
                child: Image(
                  image: snapshot.data!.image,
                  fit: BoxFit.cover,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Future<Image> _loadImage(String url) async {
  final image = NetworkImage(url);
  await image.evict();
  return Image(image: image);
}
