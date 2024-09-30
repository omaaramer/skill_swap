import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/posts/get_swap_request_controller.dart';
import 'widgets/swap_request_item.dart';

class RecieveSwapScreen extends StatelessWidget {
  const RecieveSwapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GetSwapRequestControllerImpl getSwapRequestController =
        Get.put(GetSwapRequestControllerImpl());
    final requestsList = getSwapRequestController.swapRequests;
    if (requestsList.length == 0) {
      return const Center(child: Text("No requests yet"));
    }
    return ListView.separated(
        itemCount: requestsList.length,
        separatorBuilder: (context, index) => const SizedBox(height: 2),
        itemBuilder: (context, index) =>
            CustomSwapRequsetItem(skillRequestModel: requestsList[index]));
  }
}
