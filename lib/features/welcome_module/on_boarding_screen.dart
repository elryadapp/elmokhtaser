
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import  'package:easy_localization/easy_localization.dart';
class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppUi.assets.onBoarding),
            SizedBox(height: 7.h,),
            AppSlideAnimation(
              verticalOffset: 0,horizontalOffset: 80,
              child: AppText(
                'elmokhtaser'.tr(),
                fontWeight: FontWeight.bold,
                color: AppUi.colors.titleColor,
                fontSize: 16.sp,
              ),
            ),
            AppSlideAnimation(
                            verticalOffset: 0,horizontalOffset: -80,

              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical: 2.h),
                child:   AppText(
                  'hint'.tr(),
                  maxLines: 2,
                  textAlign:TextAlign.center,
                ),
              ),
            ),
           Padding(
             padding:  EdgeInsets.symmetric(vertical: 3.h,horizontal: 4.w),
             child: AppButton(title: 'start_now'.tr(),
          onTap: ()=>Navigator.pushReplacementNamed(context, Routes.login),
          
          ),
           )
          ],
        ),
      ),
    );
  }
}
