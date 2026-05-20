import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/notes_controller.dart';
import 'package:parent_app/core/AppData.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/widget/class_pill_selector.dart';
import 'package:parent_app/views/widget/rounded_labeled_field.dart';
import 'package:parent_app/views/widget/section_label.dart';
import 'package:parent_app/views/widget/semi_circle_header.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(NotesController());

    return Scaffold(
      backgroundColor: ColorsApp.creamBase,
      body: Column(
        children: [
          const SemiCircleHeader(title: 'NOTES', showBack: true),
          const SectionLabel(
            'CHOOSE THE GRADE, SECTION, AND SUBJECT:',
          ),
          Obx(() => ClassPillSelector(
                pills: AppData.classPills,
                selectedIndex: c.selectedPillIndex.value,
                onSelected: (i) => c.selectedPillIndex.value = i,
              )),
          RoundedLabeledField(
            label: 'DATE :',
            hint: 'XX/YY/ZZZZ',
            controller: c.dateCtrl,
            suffix: Icon(Icons.calendar_today, color: ColorsApp.PraimaryMain, size: 20.sp),
          ),
          RoundedLabeledField(
            label: 'SEARCH',
            hint: 'SEARCH HERE........',
            controller: c.searchCtrl,
            suffix: Icon(Icons.search, color: ColorsApp.PraimaryMain, size: 22.sp),
          ),
          const SectionLabel('STUDENTS :'),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              itemCount: AppData.students.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppData.students[i],
                        style: TextStyle(
                          fontFamily: 'KiwiMaru',
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.textDarkBrown,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: c.noteCtrls[i],
                              decoration: InputDecoration(
                                hintText: 'NOTE TO THE PARENT....',
                                filled: true,
                                fillColor: ColorsApp.bgPureWhite,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50.r),
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          GestureDetector(
                            onTap: () => c.sendNote(i),
                            child: CircleAvatar(
                              radius: 22.r,
                              backgroundColor: ColorsApp.PraimaryMain,
                              child: Icon(Icons.send,
                                  color: ColorsApp.bgPureWhite, size: 18.sp),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
