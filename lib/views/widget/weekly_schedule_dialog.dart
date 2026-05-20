import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/colorsApp.dart';

class WeeklyScheduleDialog extends StatelessWidget {
  const WeeklyScheduleDialog({super.key});

  @override
  Widget build(BuildContext context) {
    const days = ['الأحد', 'الإثنين', 'الثلاثاء', 'الأربعاء', 'الخميس'];
    const cols = 5;

    return Material(
      //color: ColorsApp.overlayDark,
      child: Center(
        child: Container(
          margin: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: ColorsApp.bgPureWhite,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 12.h),
                decoration: const BoxDecoration(
                  color: ColorsApp.creamBase,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                child: Text(
                  'جدول الحصص الأسبوعي',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'KiwiMaru',
                    color: ColorsApp.textDarkBrown,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.w),
                child: Table(
                  border: TableBorder.all(color: Colors.grey.shade300, width: 0.5),
                  children: [
                    for (final day in days)
                      TableRow(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.w),
                            child: Text(day,
                                style: TextStyle(fontSize: 10.sp, fontFamily: 'KiwiMaru')),
                          ),
                          for (int i = 0; i < cols; i++)
                            Container(height: 28.h, color: ColorsApp.bgPureWhite),
                        ],
                      ),
                  ],
                ),
              ),
              TextButton(onPressed: Get.back, child: const Text('Close')),
            ],
          ),
        ),
      ),
    );
  }
}