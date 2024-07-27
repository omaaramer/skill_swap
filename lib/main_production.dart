import 'dart:io';

import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/services/services.dart';
import 'package:skill_swap/firebase_options.dart';
import 'package:skill_swap/skill_swap.dart';
import 'package:firebase_app_check/firebase_app_check.dart';

void main() async {
  // Disable auto-refresh for App Check during development
  // FirebaseAppCheck.instance.setTokenAutoRefreshEnabled(false);

  HttpOverrides.global = new MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  // this for fix text being hidden in flutter screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await initServices();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
