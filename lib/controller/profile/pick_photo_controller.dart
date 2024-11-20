import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:path/path.dart';

import '../Add Skills/get_user_controller.dart';

abstract class ImageController extends GetxController {
  Future<void> pickImage({required ImageSource source, required String userId});
  Future<File?> cropImage({required File imageFile});
  Future<void> uploadImageToFirebase(String userId);
}

class ImageControllerImpl extends ImageController {
  String? url;
  Rxn<File> selectedImage = Rxn<File>(); // Reactive variable
  GetUserControllerImpl userController = Get.find();
  // Method to pick an image from a source (gallery or camera)
  @override
  Future<void> pickImage(
      {required ImageSource source, required String userId}) async {
    try {
      final XFile? pickedImage = await ImagePicker().pickImage(source: source);
      if (pickedImage == null) return;

      // Crop the image after picking
      File? img = File(pickedImage.path);
      img = await cropImage(imageFile: img);
      if (img != null) {
        selectedImage.value = img; // Update the reactive variable
      }
      uploadImageToFirebase(userId);

      Get.back();
      userController.getAllUsers();
    } on PlatformException catch (e) {
      log('Error picking image: $e');
      Get.snackbar('Error', 'Failed to pick image: $e');
    }
  }

  // Method to crop an image
  @override
  Future<File?> cropImage({required File imageFile}) async {
    try {
      CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: AppColors.primary,
            toolbarWidgetColor: Colors.white,
            activeControlsWidgetColor: AppColors.primary,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            minimumAspectRatio: 1.0,
          ),
        ],
      );
      if (croppedImage == null) return null;
      return File(croppedImage.path);
    } catch (e) {
      log('Error cropping image: $e');
      return null;
    }
  }

  // Method to upload the selected image to Firebase Storage
  @override
  Future<void> uploadImageToFirebase(String userId) async {
    try {
      if (selectedImage.value == null) {
        Get.snackbar('Error', 'No image selected to upload.');
        return;
      }

      // Generate a unique file name using the user ID
      String imageName =
          "${userId}_profile_image"; // e.g., userId_profile_image
      var refStorage = FirebaseStorage.instance
          .ref("${AppConstant.kCloudStorageProfileImages}/$imageName");

      // Upload the new image
      UploadTask uploadTask = refStorage.putFile(selectedImage.value!);
      TaskSnapshot snapshot = await uploadTask;

      // Get the new download URL
      url = await snapshot.ref.getDownloadURL();

      // Notify listeners of changes
      update();
    } catch (e) {
      log('Error uploading image: $e');
      Get.snackbar('Error', 'Failed to upload image: $e');
    }
  }
}
