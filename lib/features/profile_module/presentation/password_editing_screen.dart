import 'package:elmokhtaser/core/components/app_app_bar.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/app_text_form.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class PasswordEditingScreen extends StatelessWidget {
  const PasswordEditingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: ElmoktaserAppbar(
            context,
            titleText: 'Password'.tr(),
          ),
          body: Form(
            key: cubit.passwordEditingFormKey,
            child: Padding(
              padding: EdgeInsets.all(2.7.h),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: AppText(
                          'old_passward'.tr(),
                        ),
                      ),
                      AppTextFormFeild(
                        hint: 'old_passward'.tr(),
                        validation: cubit.isNotVisable[0],
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.changeVisability(0);
                          },
                          child: Icon(cubit.isNotVisable[0]
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                        obscureText: cubit.isNotVisable[0] ? true : false,
                        controller: cubit.oldPasswordController,
                        prefixIcon: const Icon(IconBroken.Lock),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: AppText(
                          'new_password'.tr(),
                        ),
                      ),
                      AppTextFormFeild(
                        validation: cubit.isNotVisable[1],
                        controller: cubit.newPasswordController,
                        hint: 'new_password'.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this_field_is_required'.tr();
                          } else if (value.length < 8) {
                            return 'password_length_error_msg'.tr();
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.changeVisability(1);
                          },
                          child: Icon(cubit.isNotVisable[1]
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                        obscureText: cubit.isNotVisable[1] ? true : false,
                        prefixIcon: const Icon(IconBroken.Lock),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: AppText(
                          'password_confiremation'.tr(),
                        ),
                      ),
                      AppTextFormFeild(
                        controller: cubit.confirmPasswordController,
                        hint: 'password_confiremation'.tr(),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'this_field_is_required'.tr();
                          } else if (value !=
                              cubit.newPasswordController.text) {
                            return 'password_error_msg'.tr();
                          } else if (value.length < 8) {
                            return 'password_length_error_msg'.tr();
                          }
                          return null;
                        },
                        suffixIcon: InkWell(
                          onTap: () {
                            cubit.changeVisability(2);
                          },
                          child: Icon(cubit.isNotVisable[2]
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded),
                        ),
                        validation: cubit.isNotVisable[2],
                        obscureText: cubit.isNotVisable[2] ? true : false,
                        prefixIcon: const Icon(IconBroken.Lock),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      if (state.updateUserPasswordStates ==
                          UpdateUserPasswordStates.loading)
                        AppUtil.appLoader(height: 18.h)
                      else
                        AppButton(
                          title: 'Edit'.tr(),
                          onTap: () {
                            if (cubit.passwordEditingFormKey.currentState!
                                .validate()) {
                              cubit.updateUserPassword(context);
                            }
                          },
                        )
                    ]),
              ),
            ),
          ),
        );
      },
    );
  }
}
