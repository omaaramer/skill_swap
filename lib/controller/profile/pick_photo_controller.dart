import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/data/models/image_pick_prams.dart';

/// Abstract class to enforce method implementation
abstract class ImageController extends GetxController {
  Future<void> pickImage({required ImagePickParams params});
  Future<File?> cropImage({required File imageFile});
  Future<void> uploadImageToFirebase(String userId, bool isProfileImage);
}

class ImageControllerImpl extends ImageController {
  // final GetUserControllerImpl userController = Get.find();
  final DocumentReference usersRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final _storage = FirebaseStorage.instance;
  final RxBool isLoading = false.obs;
  Rxn<File> selectedProfileImage = Rxn<File>();
  Rxn<File> selectedCoverImage = Rxn<File>();
  String? imageUrl;

  @override
  Future<void> pickImage({required ImagePickParams params}) async {
    try {
      isLoading.value = true;

      final ImagePicker picker = ImagePicker();
      final XFile? pickedImage = await picker.pickImage(
        source: params.source,
        imageQuality: 80, // Add image quality compression
      );

      if (pickedImage == null) {
        isLoading.value = false;
        return;
      }

      // Convert XFile to File
      File imageFile = File(pickedImage.path);

      // Crop image
      final croppedFile = await cropImage(imageFile: imageFile);
      if (croppedFile == null) {
        isLoading.value = false;
        return;
      }
      if (params.isProfileImage) {
        selectedProfileImage.value = croppedFile;
      } else {
        selectedCoverImage.value = croppedFile;
      }

      // Upload to Firebase if userId is provided
      if (params.userId.isNotEmpty) {
        await uploadImageToFirebase(
          params.userId,
          params.isProfileImage,
        );
      }

      Get.back(); // Close bottom sheet
    } on PlatformException catch (e) {
      Get.snackbar(
        'Error',
        'Failed to pick image: ${e.message}',
        backgroundColor: Colors.red.shade100,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'An unexpected error occurred',
        backgroundColor: Colors.red.shade100,
      );
    } finally {
      isLoading.value = false;
    }
  }

  @override
  Future<File?> cropImage({required File imageFile}) async {
    try {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: imageFile.path,
        compressQuality: 80, // Add compression
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
            title: 'Crop Image',
            minimumAspectRatio: 1.0,
          ),
        ],
      );

      return croppedFile != null ? File(croppedFile.path) : null;
    } catch (e) {
      log('Error cropping image: $e');
      return null;
    }
  }

  @override
  Future<void> uploadImageToFirebase(
    String userId,
    bool isProfileImage,
  ) async {
    String selectedImage = isProfileImage
        ? selectedProfileImage.value!.path
        : selectedCoverImage.value!.path;
    try {
      final String imagePath =
          isProfileImage ? '_profile_image' : '_cover_image';
      final String imageName = '$userId$imagePath';

      // Create storage reference
      final storageRef = _storage
          .ref()
          .child(AppConstant.kCloudStorageProfileImages)
          .child(imageName);

      // Upload file with metadata
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': selectedImage},
      );

      final uploadTask = storageRef.putFile(File(selectedImage), metadata);

      // Monitor upload progress if needed
      uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        final progress =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100;
        log('Upload progress: $progress%');
      });

      // Wait for upload to complete

      final snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();

      usersRef.update({
        isProfileImage
            ? AppConstant.kProfileImageUrl
            : AppConstant.kProfileCoverImage: imageUrl
      });
    } catch (e) {
      log('Error uploading image: $e');
      Get.snackbar(
        'Error',
        'Failed to upload image. Please try again.',
        backgroundColor: Colors.red.shade100,
      );
      rethrow;
    }
  }

  // Clear selected image
  void clearImage() {
    selectedProfileImage.value = null;
    update();
  }
}
