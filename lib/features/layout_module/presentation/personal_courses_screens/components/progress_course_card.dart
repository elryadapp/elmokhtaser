import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProgressCourseCard extends StatelessWidget {
  final CourseItem coursesItem;
  const ProgressCourseCard({Key? key, required this.coursesItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, Routes.courseUnitScreen,
            arguments: coursesItem.id);
      },
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(2.h),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  AppUi.assets.networkImageBaseLink + coursesItem.image!,
                  fit: BoxFit.cover,
                  width: 32.w,
                  height: 12.h,
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              Expanded(
                child: Column(
                  children: [
                    AppText(
                      coursesItem.title!,
                      maxLines: 2,
                    ),
                    Row(
                      children: [
                        AppText(
                          '${coursesItem.progress.toString()} %',
                          color: AppUi.colors.mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                        Expanded(
                            child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  trackHeight: .4.h,
                                  overlayShape: SliderComponentShape.noOverlay,
                                  inactiveTrackColor: AppUi.colors.borderColor,
                                  thumbColor: Colors.transparent,
                                  thumbShape: const RoundSliderThumbShape(
                                      enabledThumbRadius: 0.0)),
                              child: Slider(
                                min: 0.0,
                                max: 100.0,
                                value: double.parse(
                                    coursesItem.progress.toString()),
                                onChanged: (value) {},
                              ),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
