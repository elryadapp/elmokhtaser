

import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

class TestRepositories {
  static Future<Map<String, dynamic>> getCoursesExam(
    contentChildId,
  ) async {
    var res = await DioHelper.getData(
        url: '${ApiEndPoints.courseExam}/$contentChildId',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  static Future<Map<String, dynamic>> coursesExamSubmition(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.courseExamSubmition,
        data: query,
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

//==============================course exame results============================

  static Future<Map<String, dynamic>> getCoursesExamResult(exameId) async {
    var res = await DioHelper.getData(
        url: '${ApiEndPoints.courseExamResult}/$exameId',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  //=================general exam categories===================

  static Future<Map<String, dynamic>> getExamCategories() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.examCategories,
    );
    return res.data;
  }

  //==================get general exam attempts===============
  static Future<Map<String, dynamic>> getGeneralExamAttempts(examId) async {
    var res = await DioHelper.getData(
        url: '${ApiEndPoints.generalExamAttempts}/$examId',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }



 //==================get homework exam attempts===============
  static Future<Map<String, dynamic>> getHomeworkExamAttempts(examId) async {
    var res = await DioHelper.getData(
        url: '${ApiEndPoints.homeworkExamAttempts}/$examId',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }


  //==================get user exames===================
  static Future<Map<String, dynamic>> getUserExam() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.userExam, token: 'Bearer ${Constants.token}');
    return res.data;
  }
}
