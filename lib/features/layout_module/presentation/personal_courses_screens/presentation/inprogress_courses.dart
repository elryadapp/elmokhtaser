import 'package:elmokhtaser/core/components/animated_list_handler.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:elmokhtaser/features/layout_module/presentation/personal_courses_screens/components/progress_course_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class InProgressCourses extends StatelessWidget {
  final List<CourseItem> inProgressCourseList;
  const InProgressCourses({Key? key, required this.inProgressCourseList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return inProgressCourseList.isEmpty
        ? Column(
            children: [
              AppSlideAnimation(
                verticalOffset: -150,
                horizontalOffset: 0,
                child: AppUtil.emptyLottie(),
              ),
              AppSlideAnimation(
                verticalOffset: 150,
                horizontalOffset: 0,
                child: AppText('finished_couses_alert'.tr()),
              )
            ],
          )
        : AnimatedListHandler(
            children: List.generate(
            inProgressCourseList.length,
            (index) =>
                ProgressCourseCard(coursesItem: inProgressCourseList[index]),
          ));
  }
}
