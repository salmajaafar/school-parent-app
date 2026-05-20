import 'package:get/get.dart';
import 'package:parent_app/routes/routes.dart';
import 'package:parent_app/views/widget/weekly_schedule_dialog.dart';

class HomeController extends GetxController {
  final carouselIndex = 0.obs;

  final ads = [
    'Interactive Learning in the Physics Atelier',
    'School activities this week',
  ];

  final articles = [
    {'title': 'Sending what was given', 'isPrimary': true},
    {'title': 'Sending homework', 'isPrimary': false},
    {'title': 'Send a note about a student', 'isPrimary': false},
  ];

  final schedules = [
    'Semester exam schedule',
    'Weekly class schedule',
  ];

  void onCarouselChanged(int i) => carouselIndex.value = i;

  void onArticleTap(int index) {
    switch (index) {
      case 0:
        Get.toNamed(AppRoutes.whatWasGiven);
        break;
      case 1:
        Get.toNamed(AppRoutes.homework);
        break;
      default:
        Get.toNamed(AppRoutes.notes);
        break;
    }
  }

  void openSchedule(int index) {
    if (index == 1) {
      Get.dialog(const WeeklyScheduleDialog());
    }
  }

  void openAdvertisements() => Get.toNamed(AppRoutes.advertisements);
}
