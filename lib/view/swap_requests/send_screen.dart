import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/posts/get_swap_request_controller.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'widgets/sended_swap_item.dart';

class SendScreen extends StatelessWidget {
  const SendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetSwapRequestControllerImpl getSwapRequestController =
        Get.put(GetSwapRequestControllerImpl());
    return Obx(() {
      final mySwapsRequests = getSwapRequestController.swapRequests
          .where(
            (request) =>
                request.senderId == FirebaseAuth.instance.currentUser!.uid,
          )
          .toList();
      if (getSwapRequestController.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      if (mySwapsRequests.isEmpty) {
        return const Center(
          child: Text('No swaps requests found'),
        );
      }

      return ListView.separated(
          itemCount: mySwapsRequests.length,
          separatorBuilder: (context, index) => const SizedBox(height: 2),
          itemBuilder: (context, index) {
            SwapRequest myRequest = mySwapsRequests[index];
            return SendedSwaps(swapRequest: myRequest);
          });
    });
  }
}
