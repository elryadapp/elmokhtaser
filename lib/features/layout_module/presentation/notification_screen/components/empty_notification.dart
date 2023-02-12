import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:easy_localization/easy_localization.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppUtil.emptyLottie(),
          SizedBox(
            height: 5.h,
          ),
          AppText(
            'there_are_no_notification_yet'.tr(),
            fontWeight: FontWeight.bold,
          ),
          SizedBox(
            height: 18.h,
          )
        ],
      ),
    );
  }
}
