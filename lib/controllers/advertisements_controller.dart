import 'package:get/get.dart';

class AdvertisementsController extends GetxController {
  final carouselIndex = 0.obs;
  final details = 'School event details will appear here.'.obs;

  final images = [
    'assets/images/students.jpg',
    'assets/images/students.jpg',
  ];

  void onPageChanged(int index) => carouselIndex.value = index;
}
