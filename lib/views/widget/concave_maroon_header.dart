import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

/// Maroon header with concave curved bottom edge (Figma style).
class ConcaveMaroonHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool showBack;
  final VoidCallback? onBack;

  const ConcaveMaroonHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.showBack = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _ConcaveBottomClipper(),
      child: Container(
        width: double.infinity,
        color: ColorsApp.PraimaryMain,
        padding: EdgeInsets.fromLTRB(16.w, 44.h, 16.w, 36.h),
        child: Column(
          children: [
            if (showBack)
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  onPressed: onBack,
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: ColorsApp.bgPureWhite,
                    size: 20.sp,
                  ),
                ),
              ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'KiwiMaru',
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: ColorsApp.bgPureWhite,
                letterSpacing: 2,
              ),
            ),
            if (subtitle != null) ...[
              SizedBox(height: 6.h),
              Text(
                subtitle!,
                style: TextStyle(
                  fontSize: 12.sp,
                  color: ColorsApp.bgPureWhite.withOpacity(0.92),
                  letterSpacing: 0.8,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _ConcaveBottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 28);
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height + 18,
      size.width,
      size.height - 28,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
