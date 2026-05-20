import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/colorsApp.dart';

/// One student row on the Grades screen (Figma layout).
class StudentGradeRow extends StatelessWidget {
  final String studentName;
  final TextEditingController markController;
  final TextEditingController noteController;
  final RxString fullMark;
  final VoidCallback onSend;

  const StudentGradeRow({
    super.key,
    required this.studentName,
    required this.markController,
    required this.noteController,
    required this.fullMark,
    required this.onSend,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 18.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            studentName,
            style: TextStyle(
              fontFamily: 'KiwiMaru',
              fontSize: 11.sp,
              fontWeight: FontWeight.w800,
              color: ColorsApp.textDarkBrown,
              letterSpacing: 0.5,
            ),
          ),
          SizedBox(height: 8.h),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _GradeCircleField(
                controller: markController,
                fullMark: fullMark,
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: TextField(
                  controller: noteController,
                  style: TextStyle(fontSize: 11.sp, color: ColorsApp.textDarkBrown),
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'NOTE TO THE PARENT....',
                    hintStyle: TextStyle(
                      fontSize: 10.sp,
                      color: ColorsApp.textLightBrown.withOpacity(0.85),
                    ),
                    filled: true,
                    fillColor: ColorsApp.bgPureWhite,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide.none,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50.r),
                      borderSide: BorderSide(
                        color: ColorsApp.PraimaryMain.withOpacity(0.5),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Material(
                color: ColorsApp.PraimaryMain,
                shape: const CircleBorder(),
                child: InkWell(
                  onTap: onSend,
                  customBorder: const CircleBorder(),
                  child: SizedBox(
                    width: 42.w,
                    height: 42.w,
                    child: Icon(
                      Icons.send_rounded,
                      color: ColorsApp.bgPureWhite,
                      size: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _GradeCircleField extends StatelessWidget {
  final TextEditingController controller;
  final RxString fullMark;

  const _GradeCircleField({
    required this.controller,
    required this.fullMark,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54.w,
      height: 54.w,
      decoration: const BoxDecoration(
        color: ColorsApp.bgPureWhite,
        shape: BoxShape.circle,
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 36.w,
            height: 22.h,
            child: TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w700,
                color: ColorsApp.textDarkBrown,
                height: 1,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
                hintText: '0',
                hintStyle: TextStyle(
                  fontSize: 15.sp,
                  color: ColorsApp.textLightBrown,
                ),
              ),
            ),
          ),
          Obx(
            () => Text(
              '/ ${fullMark.value}',
              style: TextStyle(
                fontSize: 7.sp,
                color: ColorsApp.textLightBrown,
                fontWeight: FontWeight.w600,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
