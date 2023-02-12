import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_list_handler.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/data/models/more_options_model.dart';
import 'package:elmokhtaser/features/layout_module/domain/services_cubit/service_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/more_screen/components/custom_expansion_tile.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:sizer/sizer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<MoreOptionsModel> optionsList = [
      MoreOptionsModel(
          title: 'General_Exams'.tr(),
          icon: Icon(
            IconBroken.Document,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.generalTest),
      MoreOptionsModel(
          title: 'Account_statement'.tr(),
          icon: Icon(
            IconBroken.Wallet,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.accountStatement),
      MoreOptionsModel(
          title: 'Certificates'.tr(),
          icon: Image.asset(AppUi.assets.gradCap),
          route: Routes.certificate),
      MoreOptionsModel(
          title: 'Affiliate_Marketing'.tr(),
          icon: Icon(
            Icons.campaign_outlined,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.marketing),
      MoreOptionsModel(
          title: 'setting'.tr(),
          icon: Icon(
            IconBroken.Setting,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.profileSetting),
      MoreOptionsModel(
          title: 'logout'.tr(),
          icon: Icon(
            IconBroken.Logout,
            color: AppUi.colors.mainColor,
          ),
          route: Routes.login)
    ];
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 2.5.h),
        child: AnimatedListHandler(noScroll: true, shrinkWrap: true, children: [
          ...optionsList.asMap().entries.map(
                (e) => BlocBuilder<ServiceCubit, ServiceState>(
                  builder: (context, state) {
                    return CustomExpansionTile(
                        isExpanded: e.key == 5 ? false : true,
                        ontap: () {
                          if (e.key == 5) {
                            ServiceCubit.get(context).userLogout(context);
                          } else {
                            Navigator.pushNamed(context, e.value.route);
                          }
                        },
                        icon: e.value.icon,
                        title: e.value.title);
                  },
                ),
              ),
        ]));
  }
}
