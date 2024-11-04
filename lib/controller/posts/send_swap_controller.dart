import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:skill_swap/controller/Add%20Skills/get_user_controller.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/data/models/reciever_model.dart';
import 'package:skill_swap/data/models/swap_request_model.dart';
import 'package:skill_swap/data/models/user_model.dart';

abstract class SendSwapController extends GetxController {
  final UserModel userModel;
  SendSwapController({
    required this.userModel,
  });
  Future<void> sendSwapRequest(
      {required RecieverModel receiver, required SkillModel skillModel});

  void listenForSwapRequests(String receiverId);

  Future<void> updateRequestStatus(String requestId, String newStatus);

  void listenForRequestUpdates(String senderId);
}

class SendSwapControllerImpl extends SendSwapController {
  SendSwapControllerImpl({required super.userModel});
  GetUserControllerImpl getUserController = Get.put(GetUserControllerImpl());

  @override
  Future<void> sendSwapRequest(
      {required RecieverModel receiver, required SkillModel skillModel}) async {
    // UserModel receiver = getUserController.userList
    //     .firstWhere((user) => user.userId == receiverName);

    final docRef = FirebaseFirestore.instance.collection('swapRequests');
    SwapRequest request = SwapRequest(
      senderImage: getUserController.user!.profileImageUrl,
      receiverImage: receiver.receiverImage,
      receiverJopTitle: receiver.receiverJopTitle,
      senderJopTitle: getUserController.user!.jopTitle,
      senderId: getUserController.user!.userId,
      receiverName: receiver.receiverName,
      receiverSkill: receiver.skill,
      senderName: getUserController.user!.fullname,
      receiverId: receiver.receiverId,
      senderSkill: skillModel.mySkill!,
      receiverSkillId: receiver.skillId,
      skillImage: skillModel.skillImage!,
      status: 'pending',
      requestTime: DateTime.now(),
    );
    await docRef.add(request.toJson());
    print('Swap request sent successfully');
  }

  @override
  void listenForSwapRequests(String receiverId) {
    FirebaseFirestore.instance
        .collection('swapRequests')
        .where('receiverId', isEqualTo: receiverId)
        .snapshots()
        .listen((snapshot) {
      for (var doc in snapshot.docs) {
        final request = SwapRequest.fromJson(doc.data());
        if (request.status == 'pending') {
          // Notify the user about the new swap request
          print('New swap request from ${request.senderId}');
        }
      }
    });
  }

  @override
  Future<void> updateRequestStatus(String requestId, String newStatus) async {
    await FirebaseFirestore.instance
        .collection('swapRequests')
        .doc(requestId)
        .update({'status': newStatus});

    print('Request status updated to $newStatus');
  }

  @override
  void listenForRequestUpdates(String senderId) {
    FirebaseFirestore.instance
        .collection('swapRequests')
        .where('senderId', isEqualTo: senderId)
        .snapshots()
        .listen((snapshot) {
      for (var doc in snapshot.docs) {
        final request = SwapRequest.fromJson(doc.data());
        if (request.status == 'accepted' || request.status == 'rejected') {
          // Notify the sender about the status update
          print('Your swap request was ${request.status}');
        }
      }
    });
  }
}
