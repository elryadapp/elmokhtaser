import 'package:elmokhtaser/core/components/animated_list_handler.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:elmokhtaser/features/layout_module/presentation/personal_courses_screens/components/progress_course_card.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class FinishedCourses extends StatelessWidget {
  final List<CourseItem> finishedCourseList;
  const FinishedCourses({Key? key, required this.finishedCourseList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return finishedCourseList.isEmpty
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
                finishedCourseList.length,
                (index) => ProgressCourseCard(
                      coursesItem: finishedCourseList[index],
                    )));
  }
}
