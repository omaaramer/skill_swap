import 'package:flutter/material.dart';
import 'package:skill_swap/core/services/services.dart';
import 'package:skill_swap/skill_swap.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(

      // DevicePreview(enabled: true, builder: (context) =>
      const SkillSwap()
      //  )
      );
}
