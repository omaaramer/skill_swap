import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class PickDateController extends GetxController {
  updateDate(DateTime newDateTime);
  saveDate();
}

class PickDateControllerImpl extends PickDateController {
  CollectionReference users = FirebaseFirestore.instance.collection('users');

  DateTime birthDate = DateTime.now();

  @override
  updateDate(DateTime newDateTime) {
    birthDate = newDateTime;
    update();
  }

  @override
  saveDate() {
    return users
        .add({
          'birthDate': birthDate,
        })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
