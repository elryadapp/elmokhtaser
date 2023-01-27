
import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

class CoursesRepositories {
  //============categories========================
  static Future<Map<String, dynamic>> getCourseCategories(context) async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.coursesCategories,
    );
    return res.data;
  }


  //======================allcourses========================
  static Future<Map<String, dynamic>> getAllCourses(page) async {
    dynamic res;
    if(Constants.token==''){
  res = await DioHelper.getData(
      url: '${ApiEndPoints.allCourses}?page=$page',
    );
    }
    else{
     res = await DioHelper.getData(
      token: 'Bearer ${Constants.token}',
      url: '${ApiEndPoints.allCourses}?page=$page',
    );
    }
    return res.data;
  }

  //======================get searched course========================
  static Future<Map<String, dynamic>> getSearchedCourses(
      String conurseName) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.coursesSearch, data: {'search': conurseName});
    return res.data;
  }

//================categorical courses===============
  static Future<Map<String, dynamic>> getCoursesByCategory(
      categoryId, context,page) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.courseCategory}/$categoryId?page=$page',
    );
    return res.data;
  }

  //====================course content==============================

  static Future<Map<String, dynamic>> getCoursesContent(courseId) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.courseContent}/$courseId',
    );
    return res.data;
  }

 //====================get course unit==============================

  static Future<Map<String, dynamic>> getCourseUnits(courseId) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.courseUnits}/$courseId',
      token: 'Bearer ${Constants.token}'
    );
    return res.data;
  }

//================================course attachment=====================

  static Future<Map<String, dynamic>> getCoursesAttachment(courseId) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.courseAttachment}/$courseId',
    );
    return res.data;
  }

//============================subscribed courses======================

  static Future<Map<String, dynamic>> getSubscribedCourses() async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.subscribedCourses,
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  static Future<Map<String, dynamic>> getCourseById(courseId) async {
    var res = await DioHelper.getData(
      token: 'Bearer ${Constants.token}',
      url: '${ApiEndPoints.singleCourse}/$courseId',
    );
    return res.data;
  }

  static Future<Map<String, dynamic>> getCourseContentById(courseId) async {
    var res = await DioHelper.getData(
      token: 'Bearer ${Constants.token}',
      url: '${ApiEndPoints.courseContent}/$courseId',
    );
    return res.data;
  }

  static Future<Map<String, dynamic>> addCourseToProgress(courseId) async {
    var res = await DioHelper.postData(
      token: 'Bearer ${Constants.token}',
      url: '${ApiEndPoints.courseProgress}/$courseId',
    );
    return res.data;
  }

  //==================check course exist in subscribe=======================

  static Future<Map<String, dynamic>> checkCourseExitInSubscirb(
      courseId) async {
    var res = await DioHelper.getData(
      token: 'Bearer ${Constants.token}',
      url: '${ApiEndPoints.checkSubscribe}/$courseId',
    );
    return res.data;
  }


  //===========================course rating================================
    static Future<Map<String, dynamic>> addRateToCourse(courseId,query) async {
    var res = await DioHelper.postData(
      token: 'Bearer ${Constants.token}',
      data: query,
      url: '${ApiEndPoints.rateCourse}/$courseId',
    );
    return res.data;
  }

  //===========================update rating================================
    static Future<Map<String, dynamic>>updateRateingToCourse(rateId,query) async {
    var res = await DioHelper.postData(
      token: 'Bearer ${Constants.token}',
      data: query,
      url: '${ApiEndPoints.updateRateCourse}/$rateId',
    );
    return res.data;
  }


}
