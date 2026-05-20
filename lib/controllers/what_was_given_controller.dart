import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhatWasGivenController extends GetxController {
  final selectedPillIndex = 0.obs;
  final dateCtrl = TextEditingController();
  final explanationCtrl = TextEditingController();

  void sendToAll() {
    Get.back();
    Get.snackbar('Sent', 'Lesson summary sent to all',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    dateCtrl.dispose();
    explanationCtrl.dispose();
    super.onClose();
  }
}
