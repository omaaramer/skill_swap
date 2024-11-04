import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/view/home_page/widgets/custom_bottom_sheet.dart';

abstract class GetSkillPostDataController extends GetxController {
  Future<void> getPosts();
  //TODO void fetchCachedPosts();
  // fetchPosts();
}

class GetSkillPostDataControllerImpl extends GetSkillPostDataController {
  RxList<SkillModel> posts = <SkillModel>[].obs;
  RxBool isLoading = false.obs;
  List<SkillModel> cachedPosts = [];

  @override
  void onInit() {
    super.onInit();
    // fetchCachedPosts();
    getPosts();
  }

  @override
  Future<void> getPosts() async {
    isLoading.value = true;

    FirebaseFirestore.instance.collection("skills").get().then((value) {
      var myPosts =
          value.docs.map((doc) => SkillModel.fromJson(doc.data())).toList();
      posts.assignAll(myPosts);
      isLoading.value = false;
      // saveDataOnHive(posts, AppConstant.kPostBox);
    }).catchError((error) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $error');
      }
    });
  }

  void showSwapSkillBottomSheet(
      BuildContext context, Function(SkillModel) onSkillSelected) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      isScrollControlled: true,
      builder: (context) {
        return SwapSkillBottomSheet(onSkillSelected: onSkillSelected);
      },
    );
  }

  // @override
  // void fetchCachedPosts() {
  //   isLoading = true.obs;
  //   var postsBox = Hive.box<PostModel>(AppConstant.kPostBox);

  //   cachedPosts.assignAll(postsBox.values.toList());

  //   isLoading = false.obs;
  // }

  // @override
  // List<SkillModel> fetchPosts() {
  //   if (cachedPosts.isNotEmpty) {
  //     return cachedPosts;
  //   }
  //   return posts;
  // }
}
