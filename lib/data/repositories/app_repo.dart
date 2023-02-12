import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';

class AppRepo {
  //===================get app images================
  static Future<Map<String, dynamic>> getAppImages() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.appImages,
    );
    return res.data;
  }
}
