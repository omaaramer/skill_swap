import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class ChatController extends GetxController {
  void sendMessage({required String receiverId});
  void getChat({required String receiverId});
}

class ChatControllerImpl extends ChatController {
  var isLoading = false.obs;
  final TextEditingController messageController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Message list to hold fetched messages
  var messages = <MessageModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Fetch chat messages if a receiver ID is provided
    if (Get.arguments != null) {
      getChat(receiverId: Get.arguments);
    }
  }

  @override
  void sendMessage({required String receiverId}) {
    if (messageController.text.isEmpty) return;

    final messageModel = MessageModel(
      message: messageController.text,
      senderId: _auth.currentUser!.uid,
      receiverId: receiverId,
      time: Timestamp.now(),
    );

    _sendChatMessage(receiverId, messageModel);
  }

  void _sendChatMessage(String receiverId, MessageModel messageModel) {
    final senderDocRef = _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages');

    final receiverDocRef = _firestore
        .collection('users')
        .doc(receiverId)
        .collection('chats')
        .doc(_auth.currentUser!.uid)
        .collection('messages');

    // Send message to sender's chat
    senderDocRef.add(messageModel.toMap()).then((_) {
      _clearMessage();
    }).catchError((e) {
      _handleError(e);
    });

    // Send message to receiver's chat
    receiverDocRef.add(messageModel.toMap()).then((_) {
      _clearMessage();
    }).catchError((e) {
      _handleError(e);
    });
  }

  void _clearMessage() {
    messageController.clear();
  }

  void _handleError(dynamic error) {
    Get.snackbar("Error", "Something went wrong: $error");
  }

  @override
  void getChat({required String receiverId}) {
    isLoading.value = true;
    final chatCollection = _firestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('chats')
        .doc(receiverId)
        .collection('messages')
        .orderBy('time');

    chatCollection.snapshots().listen((event) {
      messages.value =
          event.docs.map((doc) => MessageModel.fromMap(doc.data())).toList();

      // messages.value = [];
      // for (var doc in event.docs) {
      //   messages.add(MessageModel.fromMap(doc.data()));
      // }
      // messages.assignAll(
      // event.docs.map((doc) => MessageModel.fromMap(doc.data())).toList());
      isLoading.value = false;
    }, onError: (error) {
      isLoading.value = false;
      _handleError(error);
    });
  }

  @override
  void dispose() {
    messageController.dispose();
    super.dispose();
  }
}
