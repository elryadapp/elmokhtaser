import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sizer/sizer.dart';

class LostInternetConnection extends StatelessWidget {
  const LostInternetConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AppUi.assets.noInternetLottie,
            height: 50.h,
          ),
          SizedBox(
            height: 4.h,
          ),
          AppText(
            'there_is_no_internet_connection'.tr(),
          )
        ],
      ),
    );
  }
}
