import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/skill_request_model.dart';

abstract class GetSwapRequestController extends GetxController {
  getSwapRequests();
}

class GetSwapRequestControllerImpl extends GetSwapRequestController {
  GetUserControllerImpl getUserController = Get.put(GetUserControllerImpl());
  RxList<SkillRequestModel> swapRequests = <SkillRequestModel>[].obs;

  @override
  void onInit() {
    getSwapRequests();
    super.onInit();
  }

  @override
  getSwapRequests() {
    FirebaseFirestore.instance
        .collection("users")
        .doc(getUserController.user!.userId)
        .collection("SwapRequests")
        .get()
        .then((value) {
      swapRequests.value = value.docs
          .map((doc) => SkillRequestModel.fromDocumentSnapshot(doc))
          .toList();

      print(swapRequests);
    }).catchError((e) {
      Get.snackbar("Error", "Failed to fetch posts: $e");
    });
  }
}
