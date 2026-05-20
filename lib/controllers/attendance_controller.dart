import 'package:get/get.dart';
import 'package:parent_app/core/AppData.dart';

enum AttendanceStatus { present, absent }

class StudentAttendance {
  final String name;
  AttendanceStatus status;
  StudentAttendance({required this.name, this.status = AttendanceStatus.present});
}

class AttendanceController extends GetxController {
  final selectedPillIndex = 0.obs;
  final students = <StudentAttendance>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadStudents();
  }

  void loadStudents() {
    students.assignAll(
      AppData.students.map((n) => StudentAttendance(name: n)),
    );
  }

  void setStatus(int index, AttendanceStatus status) {
    students[index].status = status;
    students.refresh();
  }

  void sendAttendance() {
    Get.snackbar('Sent', 'Attendance sent successfully',
        snackPosition: SnackPosition.BOTTOM);
  }
}
