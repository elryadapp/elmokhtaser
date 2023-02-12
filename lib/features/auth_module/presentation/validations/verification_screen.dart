import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/app_text_form.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 5.w,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back)),
              AppText(
                'Confirm_Account'.tr(),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 6.h,
              bottom: 1.h,
            ),
            child: SizedBox(
              width: 60.w,
              child: AppText(
                'confirm_alert'.tr(),
                maxLines: 2,
                height: 1.9,
                fontSize: 14.sp,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              var authCubit = AuthCubit.get(context);
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Row(
                  children: [
                    ...authCubit.codeControllers.asMap().entries.map(
                      (e) {
                        e.value.text = authCubit.verificationCode![e.key];
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: AppTextFormFeild(
                              controller: e.value,
                              borderColor: AppUi.colors.mainColor,
                              isFilled: false,
                              textInputType: TextInputType.number,
                              radius: 5.0,
                              onChange: (value) {
                                if (value.length == 1 && e.key != 4) {
                                  FocusScope.of(context).nextFocus();
                                } else {
                                  FocusScope.of(context).unfocus();
                                }
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              switch (state.verifyStates) {
                case VerifyStates.loading:
                  return AppUtil.appLoader(height: 14.h);
                case VerifyStates.success:
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.5.h),
                    child: AppButton(
                      title: 'confirm'.tr(),
                      onTap: () {
                        AuthCubit.get(context).authVerify(context);
                      },
                    ),
                  );
                default:
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.5.h),
                    child: AppButton(
                      title: 'confirm'.tr(),
                      onTap: () {
                        AuthCubit.get(context).authVerify(context);
                      },
                    ),
                  );
              }
            },
          ),
          AppText(
            'reSend'.tr(),
            fontSize: 14.sp,
            color: AppUi.colors.mainColor,
          )
        ],
      ),
    ));
  }
}
