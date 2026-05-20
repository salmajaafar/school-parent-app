import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/AppData.dart';

class GradesController extends GetxController {
  final selectedPillIndex = 0.obs;
  final selectedTestType = RxnString();
  final testDateCtrl = TextEditingController();
  final fullMarkCtrl = TextEditingController(text: '100');

  
  final fullMark = '100'.obs;

  late final List<TextEditingController> markCtrls;
  late final List<TextEditingController> noteCtrls;

  @override
  void onInit() {
    super.onInit();
    markCtrls = List.generate(AppData.students.length, (_) => TextEditingController());
    noteCtrls = List.generate(AppData.students.length, (_) => TextEditingController());
    fullMarkCtrl.addListener(_syncFullMarkFromField);
    _syncFullMarkFromField();
  }

  void _syncFullMarkFromField() {
    final raw = fullMarkCtrl.text.trim();
    if (raw.isEmpty) {
      fullMark.value = '100';
      return;
    }
    final parsed = int.tryParse(raw);
    if (parsed != null && parsed > 0) {
      fullMark.value = parsed.toString();
    } else {
      fullMark.value = raw;
    }
  }

  int get fullMarkInt {
    final n = int.tryParse(fullMark.value);
    return (n != null && n > 0) ? n : 100;
  }

  void saveGrades() {
    Get.snackbar('Saved', 'Grades saved successfully',
        snackPosition: SnackPosition.BOTTOM);
  }

  void sendNoteToParent(int index) {
    Get.snackbar(
      'Sent',
      'Note sent for ${AppData.students[index]}',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  @override
  void onClose() {
    fullMarkCtrl.removeListener(_syncFullMarkFromField);
    testDateCtrl.dispose();
    fullMarkCtrl.dispose();
    for (final c in markCtrls) {
      c.dispose();
    }
    for (final c in noteCtrls) {
      c.dispose();
    }
    super.onClose();
  }
}
