import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/post_model.dart';

abstract class GetSkillPostDataController extends GetxController {
  Future<void> fetchPosts();
}

class GetSkillPostDataControllerImpl extends GetSkillPostDataController {
  var posts = <PostModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      // await Future.delayed(const Duration(seconds: 3));

      FirebaseFirestore.instance
          .collection("skills")
          .snapshots()
          .listen((snapshot) {
        var myPosts =
            snapshot.docs.map((doc) => PostModel.fromJson(doc.data())).toList();
        posts.assignAll(myPosts);
      });
    } catch (e) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}
