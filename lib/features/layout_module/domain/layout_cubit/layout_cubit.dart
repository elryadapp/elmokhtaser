import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:elmokhtaser/features/layout_module/data/repos/layout_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'layout_state.dart';

class LayoutCubit extends Cubit<LayoutState> {
  LayoutCubit() : super(LayoutState());
  static LayoutCubit get(context) => BlocProvider.of(context);
  //===========================main Layout=========================
  final homeSearchController = TextEditingController();

  void changeCurrentPageIndex(newIndex) {
    emit(state.copyWith(pageIndex: newIndex));
  }

  //============get main courses==============
  Future<void> getMainCourses({page = 1}) async {
    if (page == 1) {
      emit(state.copyWith(
          getMainCourses: GetMainCoursesStates.loading, coursesModel: null));
    } else {
      emit(state.copyWith(
          getMainCoursesPaginationStates:
              GetMainCoursesPaginationStates.loading));
    }
    try {
      var res = await LayoutRepo.getMainCourses(page);
      var coursesModel = CoursesModel.fromJson(res);
      emit(state.copyWith(
        getMainCourses: GetMainCoursesStates.success,
        coursesModel: coursesModel,
      ));
    } catch (error) {
      emit(state.copyWith(getMainCourses: GetMainCoursesStates.failure));
      AppUtil.flushbarNotification(error.toString());
    }
  }

  //===========get filterdCoureses==============
  Future<void> getFilterdCourse(String courseName, context) async {
    emit(state.copyWith(
        getSearchedCoursesStates: GetSearchedCoursesStates.loading));
    try {
      var res = await LayoutRepo.getSearchedCourses(courseName);

      if (res['status'] < 300) {
        var searchedCoursesModel = CoursesModel.fromJson(res);
        emit(state.copyWith(
          getSearchedCoursesStates: GetSearchedCoursesStates.success,
          coursesModel: searchedCoursesModel,
        ));
      } else {
        AppUtil.flushbarNotification(res['data']['search'][0]);
        emit(state.copyWith(
            getSearchedCoursesStates: GetSearchedCoursesStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(
          getSearchedCoursesStates: GetSearchedCoursesStates.failure));
    }
  }

  void openSearched() {
    emit(state.copyWith(isSearched: !state.isSearched));
  }
}
