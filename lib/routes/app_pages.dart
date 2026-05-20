import 'package:get/get.dart';
import 'package:parent_app/views/screens/advertisements_screen.dart';
import 'package:parent_app/views/screens/attendance_screen.dart';
import 'package:parent_app/views/screens/grades_screen.dart';
import 'package:parent_app/views/screens/homework_screen.dart';
import 'package:parent_app/views/screens/main_shell_screen.dart';
import 'package:parent_app/views/screens/notes_screen.dart';
import 'package:parent_app/views/screens/forgot_password_screen.dart';
import 'package:parent_app/views/screens/splash.dart';
import 'package:parent_app/views/screens/what_was_given_screen.dart';
import 'package:parent_app/views/screens/welcome.dart';

import 'routes.dart';

class AppPages {
  static final pages = [
    GetPage(name: AppRoutes.splash, page: () => Splash()),
    GetPage(name: AppRoutes.welcome, page: () => const Welcome()),
    GetPage(name: AppRoutes.forgotPassword, page: () => const ForgotPasswordScreen()),
    GetPage(name: AppRoutes.main, page: () => const MainShellScreen()),
    GetPage(name: AppRoutes.attendance, page: () => const AttendanceScreen()),
    GetPage(name: AppRoutes.grades, page: () => const GradesScreen()),
    GetPage(name: AppRoutes.notes, page: () => const NotesScreen()),
    GetPage(name: AppRoutes.homework, page: () => const HomeworkScreen()),
    GetPage(name: AppRoutes.whatWasGiven, page: () => const WhatWasGivenScreen()),
    GetPage(name: AppRoutes.advertisements, page: () => const AdvertisementsScreen()),
  ];
}
