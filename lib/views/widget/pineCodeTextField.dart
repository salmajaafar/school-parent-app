import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import 'package:parent_app/core/colorsApp.dart';

class CustomPinCodeTextField extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomPinCodeTextField({
    super.key,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 55.w,
      height: 60.h,

      textStyle: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.bold,
        color: ColorsApp.PraimaryMain,
      ),

      decoration: BoxDecoration(
        color: ColorsApp.bgSoftPeach,
        borderRadius: BorderRadius.circular(14.r),
        border: Border.all(
          color: ColorsApp.dustyRose,
          width: 1.2,
        ),
      ),
    );

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.h),

      child: Pinput(
        length: 6,

        defaultPinTheme: defaultPinTheme,

        focusedPinTheme: defaultPinTheme.copyDecorationWith(
          border: Border.all(
            color: ColorsApp.PraimaryMain,
            width: 1.5,
          ),
        ),

        submittedPinTheme: defaultPinTheme,

        keyboardType: TextInputType.number,

        onChanged: onChanged,

        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 250),
      ),
    );
  }
}