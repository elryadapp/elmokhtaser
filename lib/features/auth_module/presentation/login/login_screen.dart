import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/app_text_form.dart';
import 'package:elmokhtaser/core/providers/elmokhtaser_cubit/elmokhtaser_cubit.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:elmokhtaser/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUi.colors.whiteColor,
      body: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var authCubit = AuthCubit.get(context);
          return Form(
            key: authCubit.loginFormKey,
            child: AppSlideAnimation(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10.h,
                    horizontal: 5.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        LocaleKeys.Login.tr(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      if (ElmokhtaserCubit.get(context)
                              .state
                              .elmokhtaserImageModel !=
                          null)
                        AppUtil.appCachedImage(
                            height: 20.h,
                            width: Constants.getwidth(context),
                            imgUrl: AppUi.assets.networkImageBaseLink +
                                ElmokhtaserCubit.get(context)
                                    .state
                                    .elmokhtaserImageModel!
                                    .data!
                                    .imageLogin!),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h, top: 2.h),
                        child: AppText(
                          'E-mail'.tr(),
                        ),
                      ),
                      AppTextFormFeild(
                        hint: 'E-mail'.tr(),
                        textInputType: TextInputType.emailAddress,
                        controller: authCubit.loginEmailController,
                        prefixIcon: Icon(
                          IconBroken.Message,
                          size: 6.w,
                          color: AppUi.colors.subTitleColor.withOpacity(.5),
                        ),
                        filledColor: AppUi.colors.bgColor,
                        isFilled: true,
                        validation: true,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.5.h),
                        child: AppText(
                          'Password'.tr(),
                        ),
                      ),
                      AppTextFormFeild(
                        hint: 'Password'.tr(),
                        controller: authCubit.loginPasswordController,
                        prefixIcon: Icon(
                          IconBroken.Lock,
                          size: 6.w,
                          color: AppUi.colors.subTitleColor.withOpacity(.5),
                        ),
                        validation: true,
                        filledColor: AppUi.colors.bgColor,
                        isFilled: true,
                        suffixIcon: InkWell(
                          onTap: () {
                            authCubit.loginChangeVisibility();
                          },
                          child: Icon(authCubit.loginVisibilityIcon),
                        ),
                        obscureText: !state.loginVisibilityChangeState,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 3.h),
                        child: Row(
                          children: [
                            AppText(
                              'Forget_Password'.tr(),
                              color: AppUi.colors.mainColor,
                            ),
                          ],
                        ),
                      ),
                      if (state.loginStates == LoginStates.loading)
                        AppUtil.appLoader(height: 14.h)
                      else
                        AppButton(
                          title: 'Login'.tr(),
                          onTap: () {
                            if (authCubit.loginFormKey.currentState!
                                .validate()) {
                              authCubit.authLogin(context);
                            } else {
                              AppUtil.flushbarNotification('info_alert'.tr());
                            }
                          },
                        ),
                      SizedBox(
                        height: 2.h,
                      ),
                      AppButton(
                        title: 'Create_New_Account'.tr(),
                        color: AppUi.colors.btnBgColor,
                        titleColor: AppUi.colors.titleColor,
                        onTap: () =>
                            Navigator.pushNamed(context, Routes.register),
                      ),
                      Padding(
                          padding: EdgeInsets.symmetric(vertical: 3.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  color: AppUi.colors.subTitleColor,
                                  height: 1.2,
                                  width: 7.w),
                              AppText(
                                'or'.tr(),
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w600,
                              ),
                              Container(
                                  color: AppUi.colors.subTitleColor,
                                  height: 1.2,
                                  width: 7.w),
                            ],
                          )),
                      Center(
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.layout);
                          },
                          child: AppText('visitor_login'.tr(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                              textDecoration: TextDecoration.underline,
                              decorationColor: AppUi.colors.mainColor,
                              color: AppUi.colors.mainColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
