import 'package:elmokhtaser/core/components/app_app_bar.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class MarketingScreen extends StatefulWidget {
  const MarketingScreen({Key? key}) : super(key: key);

  @override
  State<MarketingScreen> createState() => _MarketingScreenState();
}

class _MarketingScreenState extends State<MarketingScreen> {
  @override
  void initState() {
    ProfileCubit.get(context).getAllCoupons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ElmoktaserAppbar(
          context,
          titleText: 'Affiliate_Marketing'.tr(),
        ),
        body: BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            var cubit = ProfileCubit.get(context);
            switch (state.getUserCouponsStates) {
              case GetUserCouponsStates.loading:
                return AppUtil.appLoader(height: 18.h);
              case GetUserCouponsStates.success:
                if (state.couponsModel!.data!.isEmpty) {
                  return Column(
                    children: [
                      AppUtil.emptyLottie(),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppText('there_are_no_Affiliate_Marketing_yet'.tr())
                    ],
                  );
                } else {
                  return Padding(
                      padding: EdgeInsets.all(2.5.h),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      '${'discount_percentage'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].discount}%',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'discount_code'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].coupon}',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'use_Frequency'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].useNumber}',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'course_name'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleWidget: AppText(
                                          '${state.couponsModel!.data![index].course}',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: state.couponsModel!.data!.length,
                      ));
                }
              default:
                if (state.couponsModel!.data!.isEmpty) {
                  return Column(
                    children: [
                      AppUtil.emptyLottie(),
                      SizedBox(
                        height: 5.h,
                      ),
                      AppText('there_are_no_Affiliate_Marketing_yet'.tr())
                    ],
                  );
                } else {
                  return Padding(
                      padding: EdgeInsets.all(2.5.h),
                      child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => Card(
                          child: Padding(
                            padding: EdgeInsets.all(2.h),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      '${'discount_percentage'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].discount}%',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'discount_code'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].coupon}',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'use_Frequency'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleColor: AppUi.colors.mainColor,
                                        title:
                                            '${state.couponsModel!.data![index].useNumber}',
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.5.h,
                                ),
                                Row(
                                  children: [
                                    AppText(
                                      '${'course_name'.tr()} : ',
                                    ),
                                    Expanded(
                                      child: AppButton(
                                        height: 4.h,
                                        color: AppUi.colors.bgColor,
                                        titleWidget: AppText(
                                          '${state.couponsModel!.data![index].course}',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        itemCount: state.couponsModel!.data!.length,
                      ));
                }
            }
          },
        ));
  }
}
