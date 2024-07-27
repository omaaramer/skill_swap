import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/post_model.dart';

abstract class GetSkillPostDataController extends GetxController {
  Future<void> fetchPosts();
}

class GetSkillPostDataControllerImpl extends GetSkillPostDataController {
  var posts = <PostModel>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPosts();
  }

  @override
  Future<void> fetchPosts() async {
    try {
      isLoading.value = true;
      final snapshot =
          await FirebaseFirestore.instance.collection("skills").get();
      var myPosts =
          snapshot.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
      posts.assignAll(myPosts);
    } catch (e) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $e');
      }
    } finally {
      isLoading.value = false;
    }
  }
}


// import 'package:get/get.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:skill_swap/data/models/post_model.dart';
// import 'package:skill_swap/constant.dart';

// class GetSkillPostDataController extends GetxController {
//   var posts = <PostModel>[].obs;
//   var isLoading = true.obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchPosts();
//   }

//   Future<void> fetchPosts() async {
//     try {
//       isLoading.value = true;
//       final snapshot = await FirebaseFirestore.instance
//           .collection("skill")
//           .get();
//       posts.value = snapshot.docs.map((doc) => PostModel.fromMap(doc.data())).toList();
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to fetch posts: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }
