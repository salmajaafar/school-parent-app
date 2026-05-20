import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeworkController extends GetxController {
  final selectedPillIndex = 0.obs;
  final dateCtrl = TextEditingController();
  final homeworkCtrl = TextEditingController();

  void sendToAll() {
    Get.back();
    Get.snackbar('Sent', 'Homework sent to all students',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    dateCtrl.dispose();
    homeworkCtrl.dispose();
    super.onClose();
  }
}
