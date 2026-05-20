import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:parent_app/controllers/grades_controller.dart';
import 'package:parent_app/core/AppData.dart';
import 'package:parent_app/core/colorsApp.dart';
import 'package:parent_app/views/widget/buttonStyle.dart';
import 'package:parent_app/views/widget/class_pill_selector.dart';
import 'package:parent_app/views/widget/concave_maroon_header.dart';
import 'package:parent_app/views/widget/rounded_labeled_field.dart';
import 'package:parent_app/views/widget/student_grade_row.dart';

class GradesScreen extends StatelessWidget {
  const GradesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(GradesController());

    return Scaffold(
      backgroundColor: ColorsApp.creamBase,
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ConcaveMaroonHeader(title: 'GRADES'),
            SizedBox(height: 12.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'CHOOSE THE GRADE, SECTION, AND SUBJECT YOU WANT TO ENTER THE MARK FOR:',
                style: TextStyle(
                  fontFamily: 'KiwiMaru',
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.textDarkBrown,
                  height: 1.45,
                  letterSpacing: 0.3,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Obx(
              () => ClassPillSelector(
                pills: AppData.classPills,
                selectedIndex: c.selectedPillIndex.value,
                onSelected: (i) => c.selectedPillIndex.value = i,
              ),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(16.w, 4.h, 16.w, 8.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RoundedLabeledField(
                      label: 'TEST DATE:',
                      hint: 'XX/YY/ZZZZ',
                      controller: c.testDateCtrl,
                      suffix: Icon(
                        Icons.calendar_today_outlined,
                        color: ColorsApp.PraimaryMain,
                        size: 20.sp,
                      ),
                    ),
                    _testTypeDropdown(c),
                    RoundedLabeledField(
                      label: 'THE FULL MARK IS:',
                      hint: '100...90...80....',
                      controller: c.fullMarkCtrl,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4.h, bottom: 10.h),
                      child: Text(
                        'STUDENTS:',
                        style: TextStyle(
                          fontFamily: 'KiwiMaru',
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w800,
                          color: ColorsApp.textDarkBrown,
                        ),
                      ),
                    ),
                    ...List.generate(
                      AppData.students.length,
                      (i) => StudentGradeRow(
                        studentName: AppData.students[i],
                        markController: c.markCtrls[i],
                        noteController: c.noteCtrls[i],
                        fullMark: c.fullMark,
                        onSend: () => c.sendNoteToParent(i),
                      ),
                    ),
                    SizedBox(height: 8.h),
                    CustomButton(
                      width: double.infinity,
                      textButton: 'Save Grades',
                      onPressed: c.saveGrades,
                    ),
                    SizedBox(height: 88.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _testTypeDropdown(GradesController c) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 6.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'TEST TYPE:',
            style: TextStyle(
              fontFamily: 'KiwiMaru',
              fontSize: 11.sp,
              fontWeight: FontWeight.w700,
              color: ColorsApp.textDarkBrown,
            ),
          ),
          SizedBox(height: 6.h),
          Obx(
            () => Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              decoration: BoxDecoration(
                color: ColorsApp.bgPureWhite,
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text(
                    'SELECT TYPE',
                    style: TextStyle(
                      fontSize: 11.sp,
                      color: ColorsApp.textLightBrown,
                    ),
                  ),
                  value: c.selectedTestType.value,
                  icon: Icon(Icons.keyboard_arrow_down,
                      color: ColorsApp.PraimaryMain),
                  items: AppData.testTypes
                      .map(
                        (e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e,
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: ColorsApp.textDarkBrown,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => c.selectedTestType.value = v,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
