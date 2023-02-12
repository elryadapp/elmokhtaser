import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/providers/elmokhtaser_cubit/elmokhtaser_cubit.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:elmokhtaser/features/auth_module/presentation/register/basic_info.dart';
import 'package:elmokhtaser/features/auth_module/presentation/register/complete_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppUi.colors.whiteColor,
      body: AppSlideAnimation(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 8.h,
              horizontal: 5.w,
            ),
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                var authCubit = AuthCubit.get(context);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () {
                              if (state.infoIndex == 0) {
                                Navigator.pop(context);
                              } else {
                                authCubit.changeIndex(0, context);
                              }
                            },
                            icon: const Icon(Icons.arrow_back)),
                        AppText(
                          'Create_Account'.tr(),
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.h),
                      child: Stack(
                        alignment: AlignmentDirectional.centerStart,
                        children: [
                          Container(
                            width: Constants.getwidth(context),
                            height: .5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppUi.colors.borderColor),
                          ),
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 600),
                            width: authCubit.animatedWidth ??
                                Constants.getwidth(context) / 2 - 5.w,
                            height: .5.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppUi.colors.mainColor),
                          )
                        ],
                      ),
                    ),
                    AppUtil.appCachedImage(
                        height: 20.h,
                        width: Constants.getwidth(context),
                        imgUrl: AppUi.assets.networkImageBaseLink +
                            ElmokhtaserCubit.get(context)
                                .state
                                .elmokhtaserImageModel!
                                .data!
                                .imageLogin!),
                    state.infoIndex == 0
                        ? const BasicInfoScreen()
                        : const CompleteInfoScreen()
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
