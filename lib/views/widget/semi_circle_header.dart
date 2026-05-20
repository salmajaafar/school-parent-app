import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/core/colorsApp.dart';

class SemiCircleHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBack;

  const SemiCircleHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(16.w, 48.h, 16.w, 28.h),
      decoration: const BoxDecoration(
        color: ColorsApp.PraimaryMain,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(80),
          bottomRight: Radius.circular(80),
        ),
      ),
      child: Column(
        children: [
          if (showBack)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                onPressed: Get.back,
                icon: Icon(Icons.arrow_back_ios_new,
                    color: ColorsApp.bgPureWhite, size: 20.sp),
              ),
            ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'KiwiMaru',
              fontSize: 20.sp,
              fontWeight: FontWeight.w700,
              color: ColorsApp.bgPureWhite,
              letterSpacing: 1.5,
            ),
          ),
          if (subtitle != null) ...[
            SizedBox(height: 6.h),
            Text(
              subtitle!,
              style: TextStyle(
                fontSize: 12.sp,
                color: ColorsApp.bgPureWhite.withOpacity(0.9),
                letterSpacing: 1,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
