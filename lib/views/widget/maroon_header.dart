import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class MaroonHeader extends StatelessWidget {
  final String title;
  const MaroonHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 48.h, bottom: 22.h),
      decoration: const BoxDecoration(
        color: ColorsApp.PraimaryMain,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(28),
          bottomRight: Radius.circular(28),
        ),
      ),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'KiwiMaru',
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: ColorsApp.bgPureWhite,
          letterSpacing: 1.5,
        ),
      ),
    );
  }
}