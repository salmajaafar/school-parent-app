import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String? value;
  final ValueChanged<String?> onChanged;

  const AppDropdown({
    super.key,
    required this.label,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: ColorsApp.bgPureWhite,
        borderRadius: BorderRadius.circular(50.r),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          hint: Text(label,
              style: TextStyle(
                  fontFamily: 'KiwiMaru',
                  fontSize: 12.sp,
                  color: ColorsApp.textLightBrown)),
          value: value,
          items: items
              .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e, style: TextStyle(fontFamily: 'KiwiMaru', fontSize: 12.sp))))
              .toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }
}