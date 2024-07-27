import 'package:get/get.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetUserController extends GetxController {
  getUser();
}

class GetUserControllerImpl extends GetUserController {
  var userList = <UserModel>[].obs;

  @override
  void onInit() {
    getUser();
    super.onInit();
  }

  @override
  getUser() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection("users").get();
      var myPosts =
          snapshot.docs.map((doc) => UserModel.fromMap(doc.data())).toList();
      userList.assignAll(myPosts);
    } catch (e) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $e');
      }
    }
  }
}
