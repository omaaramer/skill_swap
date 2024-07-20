import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skill_swap/core/services/services.dart';
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
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => const SkillSwap(),
    ),
  );
}
