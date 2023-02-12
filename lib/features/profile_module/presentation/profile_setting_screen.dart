import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/app_app_bar.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/app_text_form.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/profile_module/components/custom_image.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreenState();
}

class _ProfileSettingScreenState extends State<ProfileSettingScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).getUserData(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ElmoktaserAppbar(
          context,
          titleText: 'setting'.tr(),
        ),
        body: Padding(
          padding: EdgeInsets.all(2.7.h),
          child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: BlocBuilder<ProfileCubit, ProfileState>(
                builder: (context, state) {
                  var cubit = ProfileCubit.get(context);
                  switch (state.getUserStates) {
                    case GetUserStates.loading:
                      return AppUtil.appLoader(height: 18.h);
                    case GetUserStates.success:
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomeAppImage(),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: 2.h, bottom: 1.h),
                              child: AppText(
                                'Name'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              controller: cubit.userNameController,
                              isFilled: true,
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              hint: 'user_name'.tr(),
                              validation: true,
                              prefixIcon: Icon(
                                IconBroken.User,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                                size: 6.w,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              child: AppText(
                                'E-mail'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              isFilled: true,
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              hint: 'example@gmail.com',
                              textInputType: TextInputType.emailAddress,
                              controller: cubit.userEmailController,
                              prefixIcon: Icon(
                                IconBroken.Message,
                                size: 6.w,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              child: AppText(
                                'Phone'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              isFilled: true,
                              hint: 'Phone'.tr(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'this_field_is_required'.tr();
                                } else if (value.length < 9 ||
                                    value.length > 9) {
                                  return 'phone_error_msg'.tr();
                                }
                                return null;
                              },
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              controller: cubit.userPhoneNumberController,
                              textInputType: TextInputType.phone,
                              prefixIcon: Icon(
                                IconBroken.Call,
                                size: 6.w,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.passwordEditing);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconBroken.Lock,
                                      color: AppUi.colors.whiteColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    AppText(
                                      'edit_password'.tr(),
                                      color: AppUi.colors.mainColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (state.updateUserStates ==
                                UpdateUserStates.loading)
                              AppUtil.appLoader(height: 18.h)
                            else
                              AppButton(
                                title: 'save'.tr(),
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.updateUser(context);
                                  }
                                },
                              )
                          ],
                        ),
                      );

                    default:
                      return Form(
                        key: cubit.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomeAppImage(),
                            Padding(
                              padding: EdgeInsetsDirectional.only(
                                  top: 2.h, bottom: 1.h),
                              child: AppText(
                                'Name'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              controller: cubit.userNameController,
                              isFilled: true,
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              hint: 'user_name'.tr(),
                              validation: true,
                              prefixIcon: Icon(
                                IconBroken.User,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                                size: 6.w,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              child: AppText(
                                'E-mail'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              isFilled: true,
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              hint: 'example@gmail.com',
                              textInputType: TextInputType.emailAddress,
                              controller: cubit.userEmailController,
                              prefixIcon: Icon(
                                IconBroken.Message,
                                size: 6.w,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 2.h,
                              ),
                              child: AppText(
                                'Phone'.tr(),
                              ),
                            ),
                            AppTextFormFeild(
                              filledColor: AppUi.colors.bgColor,
                              isFilled: true,
                              hint: 'Phone'.tr(),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'this_field_is_required'.tr();
                                } else if (value.length < 9 ||
                                    value.length > 9) {
                                  return 'phone_error_msg'.tr();
                                }
                                return null;
                              },
                              suffixIcon: const Icon(IconBroken.Edit_Square),
                              controller: cubit.userPhoneNumberController,
                              textInputType: TextInputType.phone,
                              prefixIcon: Icon(
                                IconBroken.Call,
                                size: 6.w,
                                color:
                                    AppUi.colors.subTitleColor.withOpacity(.5),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 3.h),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.passwordEditing);
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      IconBroken.Lock,
                                      color: AppUi.colors.whiteColor,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    AppText(
                                      'edit_password'.tr(),
                                      color: AppUi.colors.mainColor,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (state.updateUserStates ==
                                UpdateUserStates.loading)
                              AppUtil.appLoader(height: 18.h)
                            else
                              AppButton(
                                title: 'save'.tr(),
                                onTap: () {
                                  if (cubit.formKey.currentState!.validate()) {
                                    cubit.updateUser(context);
                                  }
                                },
                              )
                          ],
                        ),
                      );
                  }
                },
              )),
        ));
  }
}
