import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class SectionLabel extends StatelessWidget {
  final String text;

  const SectionLabel(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 12.h, 16.w, 8.h),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'KiwiMaru',
          fontSize: 11.sp,
          fontWeight: FontWeight.w700,
          color: ColorsApp.textDarkBrown,
          height: 1.4,
        ),
      ),
    );
  }
}
