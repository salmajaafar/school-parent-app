import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/forgot_password_controller.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/widget/buttonStyle.dart';
import 'package:parent_app/views/widget/custom_text_feild.dart';
import 'package:parent_app/views/widget/logo.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ForgotPasswordController());

    return Scaffold(
      
      body:Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 574.w),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Logo(),
                SizedBox(height: 25.h),
                Text(
                  'Forgot Password',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'KiwiMaru',
                    fontSize: 22.sp,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.PraimaryMain,
                  ),
                ),
                SizedBox(height: 14.h),
                Text(
                  'Enter your email and we will send you a code to reset your password.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'KiwiMaru',
                    fontSize: 10.sp,
                    height: 1.6,
                    color: ColorsApp.textLightBrown,
                  ),
                ),
                SizedBox(height: 28.h),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'EMAIL',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp,
                      color: ColorsApp.bgSoftPeach,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                CustomTextField(
                  hint: 'abc@kopag.com',
                  controller: c.email,
                ),
                SizedBox(height: 32.h),
                Obx(
                  () => c.isLoading.value
                      ? const Center(child: CircularProgressIndicator())
                      : CustomButton(
                          width: double.infinity,
                          textButton: 'Send Reset Code',
                          onPressed: c.sendResetLink,
                        ),
                ),
                SizedBox(height: 16.h),
                TextButton(
                  onPressed: Get.back,
                  child: Text(
                    'Back to Log In',
                    style: TextStyle(
                      fontFamily: 'KiwiMaru',
                      fontSize: 12.sp,
                      color: ColorsApp.PraimaryMain,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
