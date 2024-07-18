import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class PickDateController extends GetxController {
  updateDate(DateTime newDateTime);
}

class PickDateControllerImpl extends PickDateController {
  DateTime date = DateTime.now();

  @override
  updateDate(DateTime newDateTime) {
    date = newDateTime;
    update();
  }
}
