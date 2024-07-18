import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class PickDateController extends GetxController {
  Future<void> selectDate(BuildContext context);
}

class PickDateControllerImpl extends PickDateController {
  DateTime selectedDate = DateTime.now();

  @override
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950, 1),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      update();
    }
  }
}
