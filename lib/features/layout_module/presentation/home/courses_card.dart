import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class CoursesCard extends StatelessWidget {
  final CourseItem coursesItem;
  const CoursesCard({Key? key, required this.coursesItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.courseDetails,
            arguments: coursesItem);
      },
      child: SizedBox(
        width: 62.w,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Image.network(
                        AppUi.assets.networkImageBaseLink + coursesItem.image!,
                        height: 15.h,
                        width: 50.w,
                        fit: BoxFit.cover,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                                size: 1.5.h,
                              ),
                              const SizedBox(
                                width: 3,
                              ),
                              AppText(
                                '${double.parse(coursesItem.averageRate.toString())}',
                                fontSize: 8.sp,
                                color: AppUi.colors.subTitleColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                AppText(
                  coursesItem.title!,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 2.5.h,
                      color: AppUi.colors.mainColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    AppText('${coursesItem.peroid} ${'days'.tr()}'),
                    const Spacer(),
                    AppText(
                      '${coursesItem.price} ${'RS'.tr()}',
                      fontWeight: FontWeight.bold,
                      color: AppUi.colors.buttonColor.withOpacity(.8),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
