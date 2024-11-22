import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skill_swap/data/models/post_model.dart';

abstract class GetSkillPostDataController extends GetxController {
  Future<void> getPosts();
  // Future<void> fetchCachedPosts();
}

class GetSkillPostDataControllerImpl extends GetSkillPostDataController {
  RxList<SkillModel> allSkills = <SkillModel>[].obs;
  RxList<SkillModel> postSkills = <SkillModel>[].obs;
  RxBool isLoading = false.obs;
  // List<SkillModel> cachedPosts = [];

  @override
  void onInit() {
    super.onInit();
    getPosts();
  }

  @override
  Future<void> getPosts() async {
    isLoading.value = true;

    try {
      final QuerySnapshot snapshot =
          await FirebaseFirestore.instance.collection("skills").get();

      // Map the Firestore documents to SkillModel objects
      final List<SkillModel> myPosts = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>; // Explicit cast
        return SkillModel.fromJson(data);
      }).toList();

      // Assign all fetched skills to `allSkills`
      allSkills.assignAll(myPosts);

      // Filter posts to exclude current user's posts
      postSkills.assignAll(
        myPosts
            .where((skill) =>
                skill.userId != FirebaseAuth.instance.currentUser!.uid)
            .toList(),
      );
    } catch (error) {
      // Log error and show a snackbar
      Get.snackbar('Error', 'Failed to fetch posts: $error');
    } finally {
      isLoading.value = false;
    }
  }

  // Uncomment and implement this if using Hive for caching
  // @override
  // Future<void> fetchCachedPosts() async {
  //   isLoading.value = true;
  //   var postsBox = Hive.box<PostModel>(AppConstant.kPostBox);

  //   // Fetch cached posts from Hive
  //   cachedPosts.assignAll(postsBox.values.toList());
  //   isLoading.value = false;
  // }
}
