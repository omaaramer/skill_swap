import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/routing/routes.dart';
import 'package:skill_swap/view/chat/chat_page.dart';

class FirebaseNotifications {
  // Create and initialize the FirebaseMessaging instance
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Request permission for receiving notifications
    await _firebaseMessaging.requestPermission();
    // Get the token
    String? token = await _firebaseMessaging.getToken();
    print("Firebase token: $token");

    backgroundMessageHandler();
  }

  // Function to handle a notification click
  void handleNotificationClick(RemoteMessage? message) {
    if (message == null) return;
    print("============>: ${message.data} ");
    Get.off(() => ChatHomePage());
  }

  //on background message
  Future backgroundMessageHandler() async {
    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleNotificationClick);

// on background message
    FirebaseMessaging.onMessageOpenedApp.listen(handleNotificationClick);

// on message
    FirebaseMessaging.onMessage.listen(handleNotificationClick);
  }
}
