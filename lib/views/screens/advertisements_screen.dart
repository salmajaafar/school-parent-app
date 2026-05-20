import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/advertisements_controller.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/widget/semi_circle_header.dart';

class AdvertisementsScreen extends StatelessWidget {
  const AdvertisementsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(AdvertisementsController());

    return Scaffold(
      backgroundColor: ColorsApp.creamBase,
      body: Column(
        children: [
          const SemiCircleHeader(title: 'ADVERTISEMENTS', showBack: true),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(24.r),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 200.h,
                        viewportFraction: 1,
                        onPageChanged: (i, _) => c.onPageChanged(i),
                      ),
                      items: c.images.map((path) {
                        return Container(
                          width: double.infinity,
                          color: ColorsApp.dustyRose,
                          child: Image.asset(
                            path,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) => Center(
                              child: Icon(Icons.image, size: 48.sp, color: Colors.white),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          c.images.length,
                          (i) => Container(
                            margin: EdgeInsets.symmetric(horizontal: 3.w),
                            width: 8.w,
                            height: 8.w,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c.carouselIndex.value == i
                                  ? ColorsApp.PraimaryMain
                                  : ColorsApp.dustyRose.withOpacity(0.4),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 12.h),
                  Row(
                    children: [
                      Icon(Icons.favorite_border, color: ColorsApp.PraimaryMain, size: 26.sp),
                      SizedBox(width: 20.w),
                      Icon(Icons.download_outlined, color: ColorsApp.PraimaryMain, size: 26.sp),
                    ],
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'DETAILS',
                    style: TextStyle(
                      fontFamily: 'KiwiMaru',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: ColorsApp.textDarkBrown,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Obx(() => Container(
                        width: double.infinity,
                        height: 120.h,
                        padding: EdgeInsets.all(16.w),
                        decoration: BoxDecoration(
                          color: ColorsApp.bgSoftPeach,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Text(
                          c.details.value,
                          style: TextStyle(
                            fontFamily: 'KiwiMaru',
                            fontSize: 12.sp,
                            color: ColorsApp.textDarkBrown,
                            height: 1.5,
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
