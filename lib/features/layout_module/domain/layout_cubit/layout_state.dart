part of 'layout_cubit.dart';

enum GetMainCoursesStates { initial, loading, success, failure }

enum GetMainCoursesPaginationStates { initial, loading, success, failure }

enum GetSearchedCoursesStates { initial, loading, success, failure }

class LayoutState {
  final int pageIndex;
  final bool isSearched;
  final CoursesModel? coursesModel;
  final GetSearchedCoursesStates getSearchedCoursesStates;
  final GetMainCoursesStates getMainCourses;
  final GetMainCoursesPaginationStates getMainCoursesPaginationStates;
  LayoutState({
    this.getMainCoursesPaginationStates =
        GetMainCoursesPaginationStates.initial,
    this.isSearched = false,
    this.coursesModel,
    this.getSearchedCoursesStates = GetSearchedCoursesStates.initial,
    this.pageIndex = 0,
    this.getMainCourses = GetMainCoursesStates.initial,
  });
  LayoutState copyWith({
    int? pageIndex,
    bool? isSearched,
    GetSearchedCoursesStates? getSearchedCoursesStates,
    CoursesModel? coursesModel,
    GetMainCoursesStates? getMainCourses,
    GetMainCoursesPaginationStates? getMainCoursesPaginationStates,
  }) {
    return LayoutState(
      isSearched: isSearched ?? this.isSearched,
      getSearchedCoursesStates:
          getSearchedCoursesStates ?? this.getSearchedCoursesStates,
      coursesModel: coursesModel ?? this.coursesModel,
      getMainCoursesPaginationStates:
          getMainCoursesPaginationStates ?? this.getMainCoursesPaginationStates,
      pageIndex: pageIndex ?? this.pageIndex,
      getMainCourses: getMainCourses ?? this.getMainCourses,
    );
  }
}
