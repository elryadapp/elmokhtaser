import 'package:elmokhtaser/config/app_routes/app_routes.dart';

import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:elmokhtaser/features/layout_module/presentation/home/components/course_container.dart';
import 'package:flutter/material.dart';

class SearchedList extends StatelessWidget {
  final List<CourseItem> coursesList;
  final int? index;
  const SearchedList({
    Key? key,
    required this.coursesList,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.courseDetails,
                arguments: coursesList[index]);
          },
          child: CourseContainer(coursesItem: coursesList[index])),
      itemCount: coursesList.length,
    );
  }
}
