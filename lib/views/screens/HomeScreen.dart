import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/home_controller.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/widget/weekly_schedule_dialog.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());

    return Scaffold(
      backgroundColor: ColorsApp.creamBase,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            _CurvedHeader(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.h),
                    _sectionTitle('ADVERTISEMENTS'),
                    SizedBox(height: 10.h),
                    GestureDetector(
                      onTap: c.openAdvertisements,
                      child: _AdsCarousel(controller: c),
                    ),
                    SizedBox(height: 8.h),
                    Obx(() => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            c.ads.length,
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
                    SizedBox(height: 20.h),
                    _sectionTitle('ARTICLES'),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 120.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: c.articles.length,
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (_, i) {
                          final item = c.articles[i];
                          final primary = item['isPrimary'] == true;
                          return GestureDetector(
                            onTap: () => c.onArticleTap(i),
                            child: Container(
                              width: 140.w,
                              padding: EdgeInsets.all(12.w),
                              decoration: BoxDecoration(
                                color: primary
                                    ? ColorsApp.PraimaryMain
                                    : ColorsApp.bgSoftPeach,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.description_outlined,
                                    color: primary
                                        ? ColorsApp.bgPureWhite
                                        : ColorsApp.PraimaryMain,
                                  ),
                                  Spacer(),
                                  Text(
                                    item['title'] as String,
                                    style: TextStyle(
                                      fontFamily: 'KiwiMaru',
                                      fontSize: 10.sp,
                                      color: primary
                                          ? ColorsApp.bgPureWhite
                                          : ColorsApp.textDarkBrown,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Icon(
                                      Icons.send,
                                      size: 16.sp,
                                      color: primary
                                          ? ColorsApp.bgPureWhite
                                          : ColorsApp.PraimaryMain,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 24.h),
                    _sectionTitle('SCHEDULES'),
                    SizedBox(height: 10.h),
                    Row(
                      children: List.generate(2, (i) {
                        return Expanded(
                          child: GestureDetector(
                            onTap: () => c.openSchedule(i),
                            child: Container(
                              margin: EdgeInsets.only(
                                  right: i == 0 ? 8.w : 0, left: i == 1 ? 8.w : 0),
                              padding: EdgeInsets.all(14.w),
                              decoration: BoxDecoration(
                                color: ColorsApp.bgSoftPeach,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.calendar_month,
                                      color: ColorsApp.PraimaryMain, size: 28.sp),
                                  SizedBox(height: 8.h),
                                  Text(
                                    c.schedules[i],
                                    style: TextStyle(
                                      fontFamily: 'KiwiMaru',
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsApp.textDarkBrown,
                                    ),
                                  ),
                                  SizedBox(height: 4.h),
                                  Text(
                                    'Click to view',
                                    style: TextStyle(
                                      fontSize: 9.sp,
                                      color: ColorsApp.textLightBrown,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 100.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String t) => Text(
        t,
        style: TextStyle(
          fontFamily: 'KiwiMaru',
          fontSize: 16.sp,
          fontWeight: FontWeight.w800,
          color: ColorsApp.textDarkBrown,
          letterSpacing: 1,
        ),
      );
}

class _CurvedHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _BottomCurveClipper(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(20.w, 12.h, 20.w, 36.h),
        color: ColorsApp.PraimaryMain,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'WELCOME BACK... 👋',
                    style: TextStyle(
                      fontFamily: 'KiwiMaru',
                      fontSize: 14.sp,
                      color: ColorsApp.bgPureWhite,
                    ),
                  ),
                  Text(
                    'WILLIAM ALEX',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: ColorsApp.bgPureWhite.withOpacity(0.9),
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.toggle_on, color: ColorsApp.bgPureWhite, size: 36.sp),
          ],
        ),
      ),
    );
  }
}

class _BottomCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height + 15, size.width, size.height - 30);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _AdsCarousel extends StatelessWidget {
  final HomeController controller;
  const _AdsCarousel({required this.controller});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 160.h,
        viewportFraction: 1,
        enlargeCenterPage: true,
        onPageChanged: (i, _) => controller.onCarouselChanged(i),
      ),
      items: controller.ads.map((text) {
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.r),
            color: ColorsApp.dustyRose,
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.all(16.w),
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'KiwiMaru',
              fontSize: 13.sp,
              fontWeight: FontWeight.w700,
              color: ColorsApp.bgPureWhite,
            ),
          ),
        );
      }).toList(),
    );
  }
}