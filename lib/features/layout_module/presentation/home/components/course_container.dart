import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:sizer/sizer.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class CourseContainer extends StatelessWidget {
  final CourseItem coursesItem;
  const CourseContainer({Key? key, required this.coursesItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 2.h),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Image.network(
                  AppUi.assets.networkImageBaseLink + coursesItem.image!,
                  width: 30.w,
                  height: 10.h,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 5.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 5,
                  ),
                  AppText(
                    coursesItem.title!,
                    textAlign: TextAlign.start,
                    maxLines: 2,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        AppText(
                          '${coursesItem.averageRate}',
                          color: Colors.amber,
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        RatingBar.builder(
                          initialRating:
                              double.parse(coursesItem.averageRate.toString()),
                          minRating: 1,
                          ignoreGestures: true,
                          itemSize: 2.h,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        AppText(
                          '(${coursesItem.ratingCount})',
                          color: AppUi.colors.subTitleColor.withOpacity(.6),
                        )
                      ],
                    ),
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
                      double.parse(coursesItem.peroid!.toString()) > 10
                          ? AppText('${coursesItem.peroid!} ${'day'.tr()}')
                          : AppText('${coursesItem.peroid!} ${'days'.tr()}'),
                      const Spacer(),
                      if (double.tryParse(coursesItem.price.toString()) != null)
                        AppText(
                          '${double.parse(coursesItem.price.toString()).toStringAsFixed(2)} ${'RS'.tr()}',
                          fontWeight: FontWeight.bold,
                          color: AppUi.colors.buttonColor.withOpacity(.8),
                        )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
