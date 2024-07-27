import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/routing/routes.dart';

abstract class AddSkillController extends GetxController {
  addSkill();
  clearTextInput();
  getImageFromGallery();
  goToHomePage();
}

class AddSkillControllerImpl extends AddSkillController {
  TextEditingController mySkill = TextEditingController();
  TextEditingController skillOfferedDescription = TextEditingController();
  TextEditingController skillNeeded = TextEditingController();
  TextEditingController skillRequestedDescription = TextEditingController();
  String? url;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  bool isOnline = true;

  @override
  addSkill() async {
    var userSnapshot =
        await FirebaseFirestore.instance.collection('skills').get();

    for (var doc in userSnapshot.docs) {
      if (doc.data()[AppConstant.kId] ==
          FirebaseAuth.instance.currentUser!.uid) {
        DocumentReference<Map<String, dynamic>> skills =
            FirebaseFirestore.instance.collection('skills').doc(doc.id);

        Map<String, dynamic> updatedData = {
          AppConstant.kIsOnline: isOnline ? "ONLINE" : "IN PERSON",
          AppConstant.kMySkill: mySkill.text,
          AppConstant.kSkillNeeded: skillNeeded.text,
          AppConstant.kId: FirebaseAuth.instance.currentUser!.uid,
          AppConstant.kProfileImageUrl: AppConstant.kProfileImageUrl,
          AppConstant.kFullname: AppConstant.kFullname,
          AppConstant.kSkillImageUrl: url,
          AppConstant.kTime: DateTime.now(),
        };
        try {
          await skills.update(updatedData);
          print('Document updated successfully!');
        } catch (e) {
          print('Error updating document: $e');
        }
      }
    }
  }

  @override
  clearTextInput() {
    mySkill.clear();
    skillOfferedDescription.clear();
    skillNeeded.clear();
    skillRequestedDescription.clear();
  }

  @override
  Future<void> getImageFromGallery() async {
    try {
      // Pick image from gallery
      XFile? imageFromGallery =
          await _picker.pickImage(source: ImageSource.gallery);

      if (imageFromGallery == null) return;

      // Convert XFile to File
      _image = File(imageFromGallery.path);

      // Get image name
      var imageName = basename(imageFromGallery.path);

      // Reference to Firebase Storage
      var refStorage = FirebaseStorage.instance
          .ref("$AppConstant.kCloudStorageSkillImages/$imageName");

      // Upload the image
      await refStorage.putFile(_image!);

      // Get download URL
      url = await refStorage.getDownloadURL();

      // Update the UI or state
      update();
    } catch (e) {
      Get.defaultDialog(
        title: "Error",
        middleText: "Something went wrong, Please try again",
      );
    }
  }

  @override
  goToHomePage() {
    Get.toNamed(Routes.homePage);
  }
}
