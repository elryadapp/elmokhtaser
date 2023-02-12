import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_list_handler.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/data/models/more_options_model.dart';
import 'package:elmokhtaser/features/layout_module/domain/services_cubit/service_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/more_screen/components/custom_expansion_tile.dart';
import 'package:elmokhtaser/features/layout_module/presentation/more_screen/components/radio_btn_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MoreOptionsModel> optionsList = [
      MoreOptionsModel(
          title: 'about_us'.tr(),
          icon: Icon(
            IconBroken.Info_Circle,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.about),
      MoreOptionsModel(
          title: 'Competitions'.tr(),
          icon: Icon(
            Icons.card_giftcard_rounded,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.competitions),
      MoreOptionsModel(
          title: 'latest_news'.tr(),
          icon: Icon(
            IconBroken.Document,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.news),
      MoreOptionsModel(
          title: 'privacy_policy'.tr(),
          icon: Icon(
            IconBroken.Shield_Done,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.privacy),
      MoreOptionsModel(
          title: 'Terms_and_Condtions'.tr(),
          icon: Icon(
            Icons.gavel_rounded,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.termsAndConditions)
    ];
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
        child: AnimatedListHandler(children: [
          ...optionsList.map(
            (e) => CustomExpansionTile(
                ontap: () {
                  Navigator.pushNamed(context, e.route);
                },
                icon: e.icon,
                title: e.title),
          ),
          Container(
              decoration: BoxDecoration(
                color: AppUi.colors.whiteColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: AppUi.colors.borderColor.withOpacity(.3),
                      blurRadius: 2)
                ],
              ),
              child: BlocBuilder<ServiceCubit, ServiceState>(
                builder: (context, state) {
                  var cubit = ServiceCubit.get(context);
                  return Theme(
                    data: Theme.of(context)
                        .copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      onExpansionChanged: (val) {
                        cubit.changeLangExpanedState(val);
                      },
                      title: Row(
                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          Icon(
                            Icons.public_outlined,
                            color: AppUi.colors.mainColor,
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          AppText('change_language'.tr()),
                        ],
                      ),
                      trailing: Transform.rotate(
                          angle: state.isLangExpanded ? 80 : 0,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: state.isLangExpanded
                                ? AppUi.colors.mainColor
                                : AppUi.colors.subTitleColor,
                            size: 2.h,
                          )),
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RadioButtonRow(
                                title: 'arabic'.tr(),
                                selectedColor: Constants.lang == 'ar'
                                    ? AppUi.colors.mainColor
                                    : AppUi.colors.whiteColor,
                                ontap: () {
                                  cubit.changeLang('ar', context);
                                },
                              ),
                              RadioButtonRow(
                                title: 'English'.tr(),
                                selectedColor: Constants.lang == 'en'
                                    ? AppUi.colors.mainColor
                                    : AppUi.colors.whiteColor,
                                ontap: () {
                                  cubit.changeLang('en', context);
                                },
                              ),
                              SizedBox(
                                height: 1.2.h,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              ))
        ]));
  }
}
