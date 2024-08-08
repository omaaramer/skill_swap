import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:skill_swap/constant.dart';
import 'package:skill_swap/core/services/firebase_notifications.dart';
import 'package:skill_swap/core/services/services.dart';
import 'package:skill_swap/data/models/post_model.dart';
import 'package:skill_swap/firebase_options.dart';

import 'package:skill_swap/skill_swap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // this for fix text being hidden in flutter screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await initServices();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseNotifications().initNotifications();
  await Hive.initFlutter();
  Hive.registerAdapter(PostModelAdapter());
  await Hive.openBox<PostModel>(AppConstant.kPostBox);
  runApp(
    // DevicePreview(enabled: true, builder: (context) =>
    const SkillSwap(),
    // ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
