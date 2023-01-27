import 'package:flutter/material.dart';
import 'package:elmoktaser_elshamel/modules/auth/_exports.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var authCubit = AuthCubit.get(context);
        return Scaffold(
          backgroundColor: AppUi.colors.whiteColor,
          body: Form(
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
                        'Login'.tr(),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 1.5.h, top: 5.h),
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
                        obscureText: authCubit.loginVisibality,
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
                      BuildCondition(
                          condition: state is LoginLoadingState,
                          builder: (context) => AppUtil.appLoader(height: 14.h),
                          fallback: (context) {
                            return AppButton(
                              title: 'Login'.tr(),
                              onTap: () {
                                if (authCubit.loginFormKey.currentState!
                                    .validate()) {
                                  authCubit.authLogin(context);
                                } else {
                                  AppUtil.flushbarNotification(
                                      'info_alert'.tr());
                                }
                              },
                            );
                          }),
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
                            Navigator.pushReplacementNamed(context, Routes.layout);
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
          ),
        );
      },
    );
  }
}
