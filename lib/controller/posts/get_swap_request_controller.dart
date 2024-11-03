import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';

abstract class GetSwapRequestController extends GetxController {
  getSwapRequests();
}

class GetSwapRequestControllerImpl extends GetSwapRequestController {
  RxList<SwapRequest> swapRequests = <SwapRequest>[].obs;

  @override
  void onInit() {
    getSwapRequests();
    super.onInit();
  }

  @override
  Future<void> getSwapRequests() async {
    await FirebaseFirestore.instance
        .collection("swapRequests")
        .get()
        .then((value) {
      swapRequests.value =
          value.docs.map((doc) => SwapRequest.fromJson(doc.data())).toList();
      print("swapRequests============= ${swapRequests.length}");
    }).catchError((e) {
      Get.snackbar("Error", "Failed to fetch posts: $e");
    });
  }
}
