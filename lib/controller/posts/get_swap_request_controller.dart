import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';

abstract class GetSwapRequestController extends GetxController {
  getSwapRequests();
}

class GetSwapRequestControllerImpl extends GetSwapRequestController {
  RxList<SwapRequest> swapRequests = <SwapRequest>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getSwapRequests(); // Start listening to real-time updates
  }

  @override
  void getSwapRequests() {
    isLoading.value = true;

    FirebaseFirestore.instance.collection("swapRequests").snapshots().listen(
        (snapshot) {
      var myRequests =
          snapshot.docs.map((doc) => SwapRequest.fromJson(doc.data())).toList();
      swapRequests.assignAll(myRequests);
      isLoading.value = false;
    }, onError: (e) {
      isLoading.value = false;
      Get.snackbar("Error", "Failed to fetch swap requests: $e");
    });
  }
}
