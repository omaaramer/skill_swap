import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/user_model.dart';

abstract class SendSwapController extends GetxController {
  final UserModel userModel;
  final PostModel postModel;
  SendSwapController({
    required this.userModel,
    required this.postModel,
  });

  void sendSwapRequest();
}

class SendSwapControllerImpl extends SendSwapController {
  SendSwapControllerImpl({required super.userModel, required super.postModel});
  GetUserControllerImpl getUserController = Get.put(GetUserControllerImpl());

  @override
  void sendSwapRequest() {
    var docref = FirebaseFirestore.instance
        .collection('users')
        .doc(userModel.userId)
        .collection('SwapRequests');

    docref.add({
      'userId': getUserController.user!.userId,
      'fullname': getUserController.user!.fullname,
      'swap': postModel.mySkill,
      'swapBy': "user",
      'jopTitle': getUserController.user!.jopTitle,
      'profileImageUrl': getUserController.user!.profileImageUrl,
      'postId': postModel.skillId,
      'timestamp': Timestamp.now(),
    }).then((value) {
      Get.snackbar('Success', 'Swap request sent successfully');
    }).catchError((error) {
      Get.snackbar('Error', 'Failed to send swap request: $error');
    });
  }
}
