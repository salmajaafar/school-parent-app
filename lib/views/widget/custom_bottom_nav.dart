import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class CustomBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final icons = [
      Icons.home_outlined,
      Icons.menu_book_outlined,
      Icons.star_outline,
      Icons.person_outline,
    ];
    final labels = ['Home', 'Classes', 'Grades', 'Profile'];

    return Padding(
      padding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
        decoration: BoxDecoration(
          color: ColorsApp.PraimaryMain,
          borderRadius: BorderRadius.circular(28.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(4, (i) {
            final active = currentIndex == i;
            return GestureDetector(
              onTap: () => onTap(i),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (active)
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: const BoxDecoration(
                        color: ColorsApp.bgPureWhite,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icons[i], color: ColorsApp.PraimaryMain, size: 20.sp),
                    )
                  else
                    Icon(icons[i], color: ColorsApp.bgPureWhite, size: 22.sp),
                  if (active) ...[
                    SizedBox(height: 4.h),
                    Text(
                      labels[i],
                      style: TextStyle(
                        color: ColorsApp.bgPureWhite,
                        fontSize: 9.sp,
                        fontFamily: 'KiwiMaru',
                      ),
                    ),
                  ],
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
