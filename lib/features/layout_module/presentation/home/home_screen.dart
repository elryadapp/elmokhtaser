import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/components/animated_page.dart';
import 'package:elmokhtaser/core/components/app_btn.dart';
import 'package:elmokhtaser/core/components/app_text.dart';
import 'package:elmokhtaser/core/components/app_text_form.dart';
import 'package:elmokhtaser/core/components/row_btn.dart';
import 'package:elmokhtaser/core/utils/app_ui.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:elmokhtaser/features/layout_module/presentation/home/components/search_list.dart';
import 'package:elmokhtaser/features/layout_module/presentation/home/category_card.dart';
import 'package:elmokhtaser/features/layout_module/presentation/home/courses_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    LayoutCubit.get(context).getMainCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          children: [
            AppTextFormFeild(
              suffixIcon: AppButton(
                title: 'search'.tr(),
                width: 22.w,
                height: 5.8.h,
                onTap: () {
                  LayoutCubit.get(context).getFilterdCourse(
                      LayoutCubit.get(context).homeSearchController.text,
                      context);
                },
              ),
              controller: LayoutCubit.get(context).homeSearchController,
              filledColor: AppUi.colors.whiteColor,
              hint: 'search_in_courses'.tr(),
              onSubmitted: (val) {
                LayoutCubit.get(context).getFilterdCourse(val, context);
              },
              prefixIcon: Icon(
                Icons.search,
                color: AppUi.colors.subTitleColor.withOpacity(.5),
              ),
            ),
            BlocBuilder<LayoutCubit, LayoutState>(
              builder: (context, state) {
                var cubit = LayoutCubit.get(context);
                if (state.isSearched) {
                  switch (state.getSearchedCoursesStates) {
                    case GetSearchedCoursesStates.loading:
                      return AppUtil.appLoader();
                    case GetSearchedCoursesStates.success:
                      return state.coursesModel!.data!.isNotEmpty
                          ? Padding(
                              padding: EdgeInsets.only(top: 2.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        cubit.openSearched();
                                      },
                                      icon: Icon(
                                        Icons.close_rounded,
                                        color: AppUi.colors.subTitleColor,
                                      )),
                                  SearchedList(
                                      coursesList: state.coursesModel!.data!),
                                ],
                              ),
                            )
                          : Column(
                              children: [
                                AppUtil.emptyLottie(),
                                SizedBox(
                                  height: 2.h,
                                ),
                                AppText(
                                  'searched_couses_alert'.tr(),
                                  fontSize: 14.sp,
                                )
                              ],
                            );
                    default:
                      return Container();
                  }
                } else {
                  switch (state.getMainCourses) {
                    case GetMainCoursesStates.loading:
                      return AppUtil.appLoader();
                    case GetMainCoursesStates.success:
                      return Column(children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 2.h),
                          child: Row(
                            children: [
                              Expanded(
                                  child: AppSlideAnimation(
                                verticalOffset: 0,
                                horizontalOffset: 80,
                                child: CategoryCard(
                                    onTab: () {
                                      Navigator.pushNamed(
                                          context, Routes.courses);
                                    },
                                    title: 'courses'.tr(),
                                    img: AppUi.assets.couresImg),
                              )),
                              Expanded(
                                child: AppSlideAnimation(
                                  verticalOffset: 0,
                                  horizontalOffset: -80,
                                  child: CategoryCard(
                                      onTab: () {
                                        Navigator.pushNamed(
                                            context, Routes.mainTests);
                                      },
                                      title: 'General_Exams'.tr(),
                                      img: AppUi.assets.testImg),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(
                            color: AppUi.colors.borderColor.withOpacity(.4),
                            thickness: 3),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 4.h, bottom: 2.h, left: 2.w, right: 2.w),
                          child: Row(
                            children: [
                              AppText('home_courses'.tr()),
                              const Spacer(),
                              RowBtn(
                                  route: Routes.courses,
                                  title: 'view_all'.tr(),
                                  isIos: true),
                            ],
                          ),
                        ),
                        state.coursesModel!.data!.isEmpty
                            ? Column(
                                children: [
                                  AppUtil.emptyLottie(
                                      height: 20.h, padding: 0.0),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  AppText(
                                    'No_courses_have_been_added_to_this_category'
                                        .tr(),
                                    fontSize: 14.sp,
                                  ),
                                ],
                              )
                            : AppSlideAnimation(
                                horizontalOffset: 0,
                                verticalOffset: 150,
                                child: SizedBox(
                                  height: 30.h,
                                  child: ListView.separated(
                                      shrinkWrap: true,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) =>
                                          CoursesCard(
                                              coursesItem: state
                                                  .coursesModel!.data![index]),
                                      separatorBuilder: (context, index) =>
                                          const SizedBox(width: 5),
                                      itemCount:
                                          state.coursesModel!.data!.length),
                                ),
                              )
                      ]);

                    default:
                      return Container();
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
