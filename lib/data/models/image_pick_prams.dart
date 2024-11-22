import 'package:image_picker/image_picker.dart';

class ImagePickParams {
  final ImageSource source;
  final String userId;
  final bool isProfileImage;

  ImagePickParams({
    required this.source,
    required this.userId,
    required this.isProfileImage,
  });
}
