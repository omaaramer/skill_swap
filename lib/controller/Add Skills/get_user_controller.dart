import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetUserController extends GetxController {
  getAllUsers();
  getUserData();
}

class GetUserControllerImpl extends GetUserController {
  var userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    getAllUsers();
    getUserData();
    super.onInit();
  }

  @override
  Future<void> getAllUsers() async {
    isLoading = true.obs;

    try {
      FirebaseFirestore.instance.collection("users").get().then((value) {
        userList.value =
            value.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      });

      isLoading = false.obs;
    } catch (e) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch posts: $e');
      }
    }
  }

  UserModel? user;
  @override
  getUserData() {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      user = UserModel.fromJson(value.data()!);
      update();
    }).catchError((e) {});
  }
}
