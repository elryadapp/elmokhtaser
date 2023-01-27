
import 'package:flutter/material.dart';
import 'package:elmoktaser_elshamel/modules/auth/_exports.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var authCubit = AuthCubit.get(context);
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
          Padding(
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
          ),
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return BuildCondition(
                  condition: state is VerifyLoadingState,
                  builder: (context)=>AppUtil.appLoader(),
                  fallback: (context) {
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 3.5.h),
                      child: AppButton(
                        title: 'confirm'.tr(),
                        onTap: () {
                          authCubit.authVerify(context);
                        },
                      ),
                    );
                  });
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
