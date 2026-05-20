import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class RoundedLabeledField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final int maxLines;
  final Widget? suffix;
  final bool readOnly;
  final VoidCallback? onTap;
  final TextInputType? keyboardType;

  const RoundedLabeledField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.maxLines = 1,
    this.suffix,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'KiwiMaru',
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: ColorsApp.textDarkBrown,
            ),
          ),
          SizedBox(height: 6.h),
          TextField(
            controller: controller,
            maxLines: maxLines,
            readOnly: readOnly,
            onTap: onTap,
            keyboardType: keyboardType,
            style: TextStyle(fontSize: 12.sp, color: ColorsApp.textDarkBrown),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 11.sp,
                color: ColorsApp.textLightBrown.withOpacity(0.8),
              ),
              filled: true,
              fillColor: ColorsApp.bgPureWhite,
              suffixIcon: suffix,
              contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(50.r),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
