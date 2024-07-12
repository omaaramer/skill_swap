import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skill_swap/core/theming/colores.dart';

alertExitApp() {
  return Get.defaultDialog(
    buttonColor: AppColors.primary,
    title: 'Exit App',
    middleText: 'Are you sure?',
    textConfirm: 'Yes',
    textCancel: 'No',
    onConfirm: () => exit(0),
    onCancel: () => Get.back(),
  );
}

//   return showDialog(
//     context: Get.context!,
//     builder: (context) => AlertDialog(
//       title: const Text('Are you sure?'),
//       content: const Text('Do you want to exit an App?'),
//       actions: <Widget>[
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(false),
//           child: const Text('No'),
//         ),
//         TextButton(
//           onPressed: () => Navigator.of(context).pop(true),
//           child: const Text('Yes'),
//         ),
//       ],
//     ),
//   );
// }
