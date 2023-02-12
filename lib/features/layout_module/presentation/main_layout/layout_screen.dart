import 'package:elmokhtaser/core/components/app_app_bar.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/custom_nav_bar/bottom_nav.dart';
import 'package:elmokhtaser/core/components/custom_nav_bar/bottom_nav_item.dart';
import 'package:elmokhtaser/core/components/lost_internet_connection.dart';
import 'package:elmokhtaser/core/network/remote/notification_helper.dart';
import 'package:elmokhtaser/core/providers/connectivity_bloc.dart/connectivity_bloc_cubit.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/core/utils/icon_broken.dart';
import 'package:elmokhtaser/features/auth_module/auth_cubit/auth_cubit.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/home/home_screen.dart';
import 'package:elmokhtaser/features/layout_module/presentation/main_layout/visitor_screen.dart';
import 'package:elmokhtaser/features/layout_module/presentation/more_screen/more_screen.dart';
import 'package:elmokhtaser/features/layout_module/presentation/notification_screen/notifications_screen.dart';
import 'package:elmokhtaser/features/layout_module/presentation/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen>
    with SingleTickerProviderStateMixin {
  List<TitledNavigationBarItem> navBarItemList = [];
  List<String> pageTitlesList = [];
  List<Widget> pages = [];
  @override
  void initState() {
    pages = Constants.token == ''
        ? const [
            HomeScreen(),
            VisitorScreen(),
            VisitorScreen(),
            VisitorScreen(),
            MoreScreen()
          ]
        : const [
            HomeScreen(),
            SizedBox(),
            // PersonalCoursesScreen(),
            NotificationScreen(),
            ProfileScreen(),
            MoreScreen()
          ];
    navBarItemList = [
      TitledNavigationBarItem(
        title: 'Home'.tr(),
        icon: IconBroken.Home,
      ),
      TitledNavigationBarItem(
        title: 'My_courses'.tr(),
        icon: IconBroken.Bookmark,
      ),
      TitledNavigationBarItem(
        title: 'notification'.tr(),
        icon: IconBroken.Notification,
      ),
      TitledNavigationBarItem(
        title: 'profile'.tr(),
        icon: IconBroken.User,
      ),
      TitledNavigationBarItem(
        title: 'More'.tr(),
        icon: IconBroken.More_Circle,
      ),
    ];
    pageTitlesList = [
      Constants.userName != ''
          ? '${'Hi'.tr()} ${Constants.userName}'
          : AuthCubit.get(context).state.userModel != null
              ? '${'Hi'.tr()} ${AuthCubit.get(context).state.userModel?.name}'
              : '${'Hi'.tr()} ${(AuthCubit.get(context).state.userModel?.name ?? '')}',
      'My_courses'.tr(),
      'notification'.tr(),
      'profile'.tr(),
      'More'.tr(),
    ];
    NotificationHelper.controller = AnimationController(vsync: this);
    var connection = ConnectivityCubit.get(context);
    connection.connectivitySubscription =
        connection.connectivity.onConnectivityChanged.listen((event) {
      connection.checkConnection(connectivity: connection.connectivity);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutState>(
      builder: (context, state) {
        var cubit = LayoutCubit.get(context);
        return Scaffold(
            appBar: ElmoktaserAppbar(
              context,
              isTitleCenterd: state.pageIndex == 0 ? false : true,
              titleText: pageTitlesList[state.pageIndex],
              isLeading: false,
            ),
            body: BlocBuilder<ConnectivityCubit, ConnectivityCubitState>(
              builder: (context, connectstate) {
                var connection = ConnectivityCubit.get(context);

                return !connection.hasConnection
                    ? const LostInternetConnection()
                    : WillPopScope(
                        child: pages[state.pageIndex],
                        onWillPop: () async {
                          if (state.pageIndex != 0) {
                            cubit.changeCurrentPageIndex(0);
                            return false;
                          } else {
                            var isConfirmed = false;
                            AppUtil.appDialoge(
                                context: context,
                                title: 'alert'.tr(),
                                content: Padding(
                                  padding: EdgeInsets.all(2.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      AppText('do_you_want_to_exsit_app'.tr()),
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Expanded(
                                              child: AppButton(
                                            onTap: () {
                                              isConfirmed = false;
                                              Navigator.pop(context);
                                            },
                                            height: 4.h,
                                            color: AppUi.colors.buttonColor
                                                .withOpacity(.9),
                                            title: 'cancel'.tr(),
                                          )),
                                          SizedBox(
                                            width: 3.w,
                                          ),
                                          Expanded(
                                              child: AppButton(
                                            onTap: () {
                                              isConfirmed = true;
                                              SystemNavigator.pop();
                                            },
                                            color: AppUi.colors.activeColor
                                                .withOpacity(.9),
                                            height: 4.h,
                                            title: 'confirm'.tr(),
                                          ))
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                            return isConfirmed;
                          }
                        });
              },
            ),
            bottomNavigationBar: TitledBottomNavigationBar(
                activeColor: AppUi.colors.mainColor,
                currentIndex: state.pageIndex,
                height: 8.h,
                onTap: (index) {
                  cubit.changeCurrentPageIndex(index);
                },
                items: List.generate(
                    navBarItemList.length, (index) => navBarItemList[index])));
      },
    );
  }
}
