import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/routes/routes.dart';

class ProfileController extends GetxController {
  final name = 'HUDA AHMAD ALI'.obs;
  final phone = '06841544585'.obs;
  final email = 'HUDAALI@GMAIL.COM'.obs;
  final grades = ['SEVEN/FIRST', 'EIGHTH/SECOND'].obs;
  final subjects = ['SCIENCE', 'MATH', 'ARABIC'].obs;

  void logout() {
    Get.dialog(
      Dialog(
        backgroundColor: ColorsApp.bgPureWhite,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Do you really want to log out?',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'KiwiMaru',
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.textDarkBrown,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                      Get.offAllNamed(AppRoutes.welcome);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.logoutYesRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text('yes', style: TextStyle(fontSize: 13.sp,color: ColorsApp.bgPureWhite)),
                  ),
                  ElevatedButton(
                    onPressed: Get.back,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsApp.logoutNoGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                    ),
                    child: Text('no', style: TextStyle(fontSize: 13.sp,color: ColorsApp.bgPureWhite)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
