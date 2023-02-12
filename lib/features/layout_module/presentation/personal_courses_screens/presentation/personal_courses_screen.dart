import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/layout_module/presentation/personal_courses_screens/presentation/finished_courses.dart';
import 'package:elmokhtaser/features/layout_module/presentation/personal_courses_screens/presentation/inprogress_courses.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class PersonalCoursesScreen extends StatefulWidget {
  const PersonalCoursesScreen({Key? key}) : super(key: key);

  @override
  State<PersonalCoursesScreen> createState() => _PersonalCoursesScreenState();
}

class _PersonalCoursesScreenState extends State<PersonalCoursesScreen>
    with SingleTickerProviderStateMixin {
  List<String> personalCoursesTabList = [];
  @override
  void initState() {
    personalCoursesTabList = ['inprogress'.tr(), 'finished'.tr()];
    var cubit = CoursesCubit.get(context);

    cubit.personalTabController = TabController(length: 2, vsync: this);

    cubit.getSubscribedCourses(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
        condition: CacheHelper.getData(key: 'jwt') != null,
        fallback: (context) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: AppText(
                    'login_alert'.tr(),
                  )),
                  SizedBox(
                    height: 3.h,
                  ),
                  AppButton(
                      width: 50.w,
                      height: 5.h,
                      title: 'Login'.tr(),
                      onTap: () {
                        Navigator.pushReplacementNamed(context, Routes.login);
                      })
                ],
              ),
            ),
        builder: (context) {
          return Column(
            children: [
              Container(
                width: Constants.getwidth(context),
                decoration: BoxDecoration(
                  color: AppUi.colors.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: AppUi.colors.shadeColor,
                    ),
                  ],
                ),
                child: TabBar(
                    onTap: (index) {},
                    labelColor: AppUi.colors.mainColor,
                    isScrollable: true,
                    physics: const BouncingScrollPhysics(),
                    unselectedLabelColor: AppUi.colors.subTitleColor,
                    labelPadding: EdgeInsets.zero,
                    indicatorSize: TabBarIndicatorSize.label,
                    labelStyle:
                        TextStyle(fontWeight: FontWeight.w700, fontSize: 12.sp),
                    controller: cubit.personalTabController,
                    tabs: [
                      ...personalCoursesTabList.asMap().entries.map((e) =>
                          Padding(
                              padding: const EdgeInsetsDirectional.only(
                                  start: 10, end: 10),
                              child: SizedBox(
                                width: Constants.getwidth(context) * .45,
                                child: Tab(
                                  child: AppText(
                                    e.value,
                                    fontSize: 12.sp,
                                  ),
                                ),
                              )))
                    ]),
              ),
              BuildCondition(
                  condition: state is GetSubscribedCourseLoadingState,
                  builder: (context) => Expanded(child: AppUtil.appLoader()),
                  fallback: (context) {
                    return Expanded(
                        child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 2.h, horizontal: 2.5.w),
                      child: TabBarView(
                          controller: cubit.personalTabController,
                          children: [
                            InProgressCourses(
                                inProgressCourseList:
                                    cubit.inProgressCoursesList),
                            FinishedCourses(
                              finishedCourseList: cubit.finishedCoursesList,
                            )
                          ]),
                    ));
                  }),
            ],
          );
        });
  }
}
