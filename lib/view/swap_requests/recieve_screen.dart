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
    final getSwapRequestController = Get.find<GetSwapRequestControllerImpl>();

    return Obx(() {
      if (getSwapRequestController.isLoading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final myRequests = getSwapRequestController.swapRequests
          .where((request) =>
              request.receiverId == FirebaseAuth.instance.currentUser!.uid)
          .toList();

      if (myRequests.isEmpty) {
        return const Center(child: Text('No swap requests found'));
      }

      return ListView.separated(
        itemCount: myRequests.length,
        separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemBuilder: (context, index) {
          SwapRequest request = myRequests[index];
          return CustomSwapRequsetItem(swapRequest: request);
        },
      );
    });
  }
}
