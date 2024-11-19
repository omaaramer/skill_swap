import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:skill_swap/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class GetUserController extends GetxController {
  getAllUsers();
  streamMyData();
}

class GetUserControllerImpl extends GetUserController {
  var userList = <UserModel>[].obs;
  RxBool isLoading = false.obs;
  Rxn<UserModel> user = Rxn<UserModel>(); // Reactive user

  @override
  void onInit() {
    getAllUsers();
    streamMyData(); // Start listening to changes in the current user data
    super.onInit();
  }

  @override
  Future<void> getAllUsers() async {
    isLoading.value = true; // Use `.value` to set observable values directly
    try {
      FirebaseFirestore.instance.collection("users").get().then((value) {
        userList.value =
            value.docs.map((doc) => UserModel.fromJson(doc.data())).toList();
      });
      isLoading.value = false;
    } catch (e) {
      if (Get.isSnackbarOpen == false) {
        Get.snackbar('Error', 'Failed to fetch users: $e');
      }
    }
  }

  @override
  void streamMyData() {
    String userId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        user.value = UserModel.fromJson(snapshot.data()!);
      } else {
        user.value =
            null; // Handle the case where the document is deleted or doesn't exist
      }
      update(); // Notify GetX to rebuild any listeners
    });
  }
}
