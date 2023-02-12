import 'package:elmokhtaser/core/components/app_app_bar.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/profile_module/domain/cubits/profile_cubit/profile_cubit.dart';
import 'package:elmokhtaser/features/profile_module/presentation/account_statemanagement_screens/components/account_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart' as tr;

class AccountStatementScreen extends StatelessWidget {
  const AccountStatementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: ElmoktaserAppbar(
          context,
          titleText: 'Account_statement'.tr(),
        ),
        body: Padding(
          padding: EdgeInsets.all(2.5.h),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: Constants.getHeight(context) * .27,
                        width: Constants.getwidth(context),
                        decoration: BoxDecoration(
                            color: AppUi.colors.whiteColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3, color: AppUi.colors.shadeColor)
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AppText(
                              'profits'.tr(),
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            AppButton(
                              width: 30.w,
                              height: 5.5.h,
                              title: '100 ${'RS'.tr()}',
                              color: AppUi.colors.borderColor,
                              onTap: () {},
                            ),
                            AppButton(
                              height: 5.5.h,
                              color: AppUi.colors.buttonColor,
                              title: 'profit_withdrawal'.tr(),
                              width: 30.w,
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: AppText(
                          '${'Financial_transactions'.tr()} : ',
                          textAlign: TextAlign.start,
                          color: AppUi.colors.mainColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            IconBroken.Filter,
                            color: AppUi.colors.mainColor,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          AppText(
                            'Filter_by_date'.tr(),
                            fontWeight: FontWeight.w600,
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        child: Row(
                          children: [
                            Expanded(
                                child: AppButton(
                              border: Border.all(
                                  color:
                                      AppUi.colors.borderColor.withOpacity(.5)),
                              color: AppUi.colors.whiteColor,
                              titleWidget: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  children: [
                                    const AppText('ابريل'),
                                    const Spacer(),
                                    Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      color: AppUi.colors.subTitleColor,
                                    )
                                  ],
                                ),
                              ),
                            )),
                            SizedBox(
                              width: 5.w,
                            ),
                            Expanded(
                                child: AppButton(
                                    border: Border.all(
                                        color: AppUi.colors.borderColor
                                            .withOpacity(.5)),
                                    color: AppUi.colors.whiteColor,
                                    titleWidget: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 5.w),
                                      child: Row(
                                        children: [
                                          const AppText('2022'),
                                          const Spacer(),
                                          Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color: AppUi.colors.subTitleColor)
                                        ],
                                      ),
                                    )))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                BlocBuilder<ProfileCubit, ProfileState>(
                  builder: (context, state) {
                    var cubit = ProfileCubit.get(context);
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                          (context, index) => AccountCard(
                              accountModel: cubit.billDetailsList[index]),
                          childCount: cubit.billDetailsList.length),
                    );
                  },
                )
              ],
            ),
          ),
        ));
  }
}
