part of 'personal_courses_cubit.dart';

enum GetSubscribedCourseStates { initial, loading, success, failure }

class PersonalCoursesState {
  final String? exception;
  final GetSubscribedCourseStates getSubscribedCourseStates;
  final CoursesModel? coursesModel;

  PersonalCoursesState({
    this.exception,
    this.getSubscribedCourseStates = GetSubscribedCourseStates.initial,
    this.coursesModel,
  });

  PersonalCoursesState copyWith({
    String? exception,
    GetSubscribedCourseStates? getSubscribedCourseStates,
    CoursesModel? coursesModel,
  }) {
    return PersonalCoursesState(
        exception: exception ?? this.exception,
        getSubscribedCourseStates:
            getSubscribedCourseStates ?? this.getSubscribedCourseStates);
  }
}
