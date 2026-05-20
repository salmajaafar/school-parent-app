import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class ClassPillSelector extends StatelessWidget {
  final List<String> pills;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

  const ClassPillSelector({
    super.key,
    required this.pills,
    required this.selectedIndex,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44.h,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: pills.length,
        separatorBuilder: (_, __) => SizedBox(width: 10.w),
        itemBuilder: (_, i) {
          final selected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onSelected(i),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              decoration: BoxDecoration(
                color: selected ? ColorsApp.PraimaryMain : ColorsApp.bgPureWhite,
                borderRadius: BorderRadius.circular(50.r),
                border: Border.all(
                  color: selected
                      ? ColorsApp.PraimaryMain
                      : ColorsApp.textDarkBrown.withOpacity(0.45),
                  width: 1.2,
                ),
              ),
              child: Text(
                pills[i],
                style: TextStyle(
                  fontFamily: 'KiwiMaru',
                  fontSize: 9.sp,
                  fontWeight: FontWeight.w700,
                  color: selected ? ColorsApp.bgPureWhite : ColorsApp.textDarkBrown,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
