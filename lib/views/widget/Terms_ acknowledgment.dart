import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parent_app/core/colorsApp.dart';

class TermsAcknowledgment extends StatelessWidget {
  const TermsAcknowledgment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Text.rich(
          TextSpan(
            text: 'By logging in, I agree to the ',
            style: TextStyle(
              fontSize: 14.sp,
              color: ColorsApp.textLightBrown, 
            ),
            children: [
              TextSpan(
                text: 'Terms of Service',
                style: TextStyle(
                  color: ColorsApp.PraimaryMain,
                  fontWeight: FontWeight.bold, 
                  decoration: TextDecoration.underline, 
                ),
              ),
              TextSpan(
                text: ' and ',
                style: TextStyle(
                  color: ColorsApp.textLightBrown,
                ),
              ),
              TextSpan(
                text: 'Privacy Policy',
                style: TextStyle(
                  color: ColorsApp.PraimaryMain, 
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}