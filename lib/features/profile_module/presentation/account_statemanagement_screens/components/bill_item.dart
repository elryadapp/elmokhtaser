import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class BillItem extends StatelessWidget {
  final String title;
  final String info;
  const BillItem({Key? key, required this.title, required this.info})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 1.5.h),
          child: Row(
            children: [
              AppText(
                title,
                fontWeight: FontWeight.w600,
              ),
              const Spacer(),
              AppText(
                info,
                fontSize: 11.sp,
              )
            ],
          ),
        ),
        if (title != 'date'.tr())
          Divider(
            color: AppUi.colors.bgColor,
            thickness: 2,
          )
      ],
    );
  }
}
