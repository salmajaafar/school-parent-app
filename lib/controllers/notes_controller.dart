import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/AppData.dart';

class NotesController extends GetxController {
  final selectedPillIndex = 0.obs;
  final dateCtrl = TextEditingController();
  final searchCtrl = TextEditingController();
  late final List<TextEditingController> noteCtrls;

  @override
  void onInit() {
    super.onInit();
    noteCtrls = List.generate(AppData.students.length, (_) => TextEditingController());
  }

  void sendNote(int index) {
    Get.snackbar('Sent', 'Note sent to ${AppData.students[index]}',
        snackPosition: SnackPosition.BOTTOM);
  }

  @override
  void onClose() {
    dateCtrl.dispose();
    searchCtrl.dispose();
    for (final c in noteCtrls) {
      c.dispose();
    }
    super.onClose();
  }
}
