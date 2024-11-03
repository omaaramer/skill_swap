import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/posts/get_swap_request_controller.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'widgets/swap_request_item.dart';

class RecieveSwapScreen extends StatelessWidget {
  const RecieveSwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetSwapRequestControllerImpl getSwapRequestController =
        Get.put(GetSwapRequestControllerImpl());
    final requestsList = getSwapRequestController.swapRequests;

    // Use .where() and check if it's not empty to avoid errors
    final myrequests = getSwapRequestController.swapRequests
        .where(
          (request) =>
              request.receiverId == FirebaseAuth.instance.currentUser!.uid,
        )
        .toList();

    SwapRequest request = myrequests.first;
    return ListView.separated(
      itemCount: requestsList.length,
      separatorBuilder: (context, index) => const SizedBox(height: 2),
      itemBuilder: (context, index) =>
          CustomSwapRequsetItem(swapRequest: request),
    );
  }
}
