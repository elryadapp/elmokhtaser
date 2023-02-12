import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/profile_module/data/models/user_certificate_model.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:sizer/sizer.dart';

class CertificateImage extends StatelessWidget {
  final CertificateItem certificateItem;
  const CertificateImage({Key? key, required this.certificateItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: [
            Image.asset(
              AppUi.assets.certificateBg,
              fit: BoxFit.cover,
              height: 55.h,
            ),
            Container(
              padding: EdgeInsets.all(2.h),
              height: 50.h,
              margin: EdgeInsets.all(2.h),
              decoration: BoxDecoration(
                  border: Border.all(color: AppUi.colors.titleColor)),
              child: Column(
                children: [
                  Row(children: [
                    Image.asset(
                      AppUi.assets.logo,
                      height: 5.h,
                      width: 10.w,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      AppUi.assets.logoName,
                      height: 3.h,
                      fit: BoxFit.cover,
                    ),
                  ]),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: Directionality(
                      textDirection: Constants.lang == 'ar'
                          ? TextDirection.rtl
                          : TextDirection.ltr,
                      child: Row(
                        children: [
                          AppText(
                            '${'created_at'.tr()} : ',
                            fontWeight: FontWeight.w600,
                          ),
                          AppText(intl.DateFormat.yMd().format(DateTime.parse(
                              certificateItem.createdAt ??
                                  certificateItem.updatedAt))),
                        ],
                      ),
                    ),
                  ),
                  AppText(
                    'Certificate'.tr(),
                    fontWeight: FontWeight.w800,
                    color: const Color(0xffC99A2E),
                    fontSize: 18.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.2.h),
                    child: AppText(
                      'This_certificate_is_proudly_presented_to'.tr(),
                      fontWeight: FontWeight.w600,
                      textAlign: TextAlign.center,
                      fontSize: 14.sp,
                    ),
                  ),
                  AppText(
                    Constants.userName != ''
                        ? Constants.userName
                        : ProfileCubit.get(context).userNameController.text,
                    decorationColor: const Color(0xffC99A2E),
                    fontWeight: FontWeight.w700,
                    textDecoration: TextDecoration.underline,
                    fontSize: 16.sp,
                    color: AppUi.colors.titleColor,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 1.h,
                    ),
                    child: AppText(
                      'certificates_note'.tr(),
                      fontSize: 10.sp,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Image.asset(AppUi.assets.signture),
                      Padding(
                        padding: EdgeInsetsDirectional.only(start: 40.w),
                        child: const Divider(
                            thickness: 1.2, color: Color(0xffC99A2E)),
                      ),
                      AppText(
                          '${'teacher'.tr()} / ${certificateItem.course!.teachers![0].name!}')
                    ],
                  )
                ],
              ),
            ),
            PositionedDirectional(
              top: 0,
              end: 0,
              child: Image.asset(
                AppUi.assets.certificateShape1,
                fit: BoxFit.fill,
                height: 15.h,
                width: 25.w,
              ),
            ),
            PositionedDirectional(
              bottom: 0,
              start: 0,
              child: Image.asset(
                AppUi.assets.certificateShape2,
                fit: BoxFit.fill,
                height: 15.h,
                width: 25.w,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
