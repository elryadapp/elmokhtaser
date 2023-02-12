import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

class LayoutRepo {
  //==================get main courses==================
  static Future<Map<String, dynamic>> getMainCourses(page) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.allCourses}?page=$page',
      token: Constants.token != '' ? 'Bearer ${Constants.token}' : '',
    );

    return res.data;
  }

  //============get filterd courses================
  static Future<Map<String, dynamic>> getSearchedCourses(
      String conurseName) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.coursesSearch, data: {'search': conurseName});
    return res.data;
  }
}
