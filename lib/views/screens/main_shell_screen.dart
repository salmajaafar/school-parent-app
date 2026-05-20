import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/main_shell_controller.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/screens/attendance_screen.dart';
import 'package:parent_app/views/screens/grades_screen.dart';
import 'package:parent_app/views/screens/HomeScreen.dart';
import 'package:parent_app/views/screens/profile_screen.dart';
import 'package:parent_app/views/widget/custom_bottom_nav.dart';

class MainShellScreen extends StatelessWidget {
  const MainShellScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MainShellController());
    final pages = const [
      HomeScreen(),
      AttendanceScreen(),
      GradesScreen(),
      ProfileScreen(),
    ];

    return Obx(() => Scaffold(
          backgroundColor: ColorsApp.creamBase,
          body: pages[c.currentIndex.value],
          bottomNavigationBar: CustomBottomNav(
            currentIndex: c.currentIndex.value,
            onTap: c.changeTab,
          ),
        ));
  }
}
