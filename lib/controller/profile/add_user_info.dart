import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/core/theming/colores.dart';
import 'package:skill_swap/data/models/user_model.dart';

abstract class ProfileController extends GetxController {
  getImageFromGallery({required ImageSource source});
  addUserData();
  updateBirthDate(DateTime newDateTime);
  Future<File?> cropImage({required File imageFile});
}

class ProfileControllerImpl extends ProfileController {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController jopTitle = TextEditingController();
  TextEditingController phone = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  final formKey = GlobalKey<FormState>();
  final String userId = FirebaseAuth.instance.currentUser!.uid;
  String? url;
  Rxn<File> selectedImage = Rxn<File>(); // Reactive variable
  DateTime birthDate = DateTime.now();
  DocumentReference usersRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  @override
  Future<void> getImageFromGallery({required ImageSource source}) async {
    try {
      // Pick an image from the gallery
      XFile? pickedImage = await _picker.pickImage(source: source);

      if (pickedImage == null) return;

      // Convert to a File object
      File? _image = File(pickedImage.path);
      _image = await cropImage(imageFile: _image);
      if (_image != null) {
        selectedImage.value = _image; // Update the reactive variable
      }

      // Use the user ID to generate a unique file name
      String imageName =
          "${userId}_profile_image"; // e.g., userId_profile_image
      var refStorage = FirebaseStorage.instance
          .ref("${AppConstant.kCloudStorageProfileImages}/$imageName");

      // Upload the image
      await refStorage.putFile(_image!);
      Get.back();
      // Get the download URL
      url = await refStorage.getDownloadURL();

      // Notify listeners of changes
      update();
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Failed to upload image. Please try again.",
      );
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
            toolbarWidgetColor: AppColors.white,
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

  @override
  addUserData() {
    if (url != null) {
      final UserModel user = UserModel(
        fullname: name.text,
        address: address.text,
        phone: phone.text,
        birthDate: birthDate,
        jobTitle: jopTitle.text,
        userId: userId, // مالوش لازمة
        profileImageUrl: url ?? '',
      );

      usersRef.set(user.toJson()).then((value) {
        Get.offNamed(Routes.homePage);
      }).catchError((error) {
        Get.snackbar(
          "Warning",
          "Failed to add user: $error",
          duration: const Duration(seconds: 3),
        );
      });
    } else {
      Get.snackbar(
        "Error",
        "Please provide a skill image",
        duration: const Duration(seconds: 3),
      );
    }
  }

  @override
  updateBirthDate(DateTime newDateTime) {
    birthDate = newDateTime;
    update();
  }

  @override
  void dispose() {
    jopTitle.dispose();
    name.dispose();
    address.dispose();
    phone.dispose();
    super.dispose();
  }
}
