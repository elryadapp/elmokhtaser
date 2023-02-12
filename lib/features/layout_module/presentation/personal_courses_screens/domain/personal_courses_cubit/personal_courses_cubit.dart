import 'package:bloc/bloc.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/features/layout_module/data/models/courses_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'personal_courses_state.dart';

class PersonalCoursesCubit extends Cubit<PersonalCoursesState> {
  PersonalCoursesCubit() : super(PersonalCoursesState());
  static PersonalCoursesCubit get(context) => BlocProvider.of(context);

  //============================Subscribed Courses====================

  List<CoursesItem> subscribedCoursesList = [];
  List<CoursesItem> inProgressCoursesList = [];
  List<CoursesItem> finishedCoursesList = [];

  Future<void> getSubscribedCourses(context) async {
    subscribedCoursesList = [];
    inProgressCoursesList = [];
    finishedCoursesList = [];
    emit(GetSubscribedCourseLoadingState());
    try {
      var res = await CoursesRepositories.getSubscribedCourses();
      if (res['status'] < 300) {
        inProgressCoursesList = [];
        finishedCoursesList = [];
        subscribedCoursesModel = CoursesModel.fromJson(res);
        subscribedCoursesList = subscribedCoursesModel?.data ?? [];

        for (var item in subscribedCoursesList) {
          if (item.progress < 100) {
            inProgressCoursesList.add(item);
          } else {
            finishedCoursesList.add(item);
          }
        }
        emit(GetSubscribedCourseLoadedState());
      } else {
        AppUtil.flushbarNotification(res['data']);
        emit(GetSubscribedCourseErrorState());
      }
    } catch (error) {
      emit(GetSubscribedCourseErrorState());
    }
  }
}
