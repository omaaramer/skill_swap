import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/helpers/save_data_on_hive.dart';
import 'package:skill_swap/data/models/post_model.dart';

abstract class GetSkillPostDataController extends GetxController {
  Future<void> fetchPosts();
}

class GetSkillPostDataControllerImpl extends GetSkillPostDataController {
  RxList<PostModel> posts = <PostModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  Future<void> fetchPosts() async {
    isLoading.value = true;

    FirebaseFirestore.instance.collection("skills").get().then((value) {
      var myPosts =
          value.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
      posts.assignAll(myPosts);
      isLoading.value = false;
      saveDataOnHive(posts, AppConstant.kPostBox);
    }).catchError((error) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $error');
      }
    });
  }
}
