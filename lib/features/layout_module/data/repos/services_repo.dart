import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

class ServicesRepo {
  //===============================about=================================
  static Future<Map<String, dynamic>> getAboutData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.about,
    );
    return res.data;
  }

  static Future<Map<String, dynamic>> getTeamsData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.teams,
    );
    return res.data;
  }
  //==================================termes=========================================

  static Future<Map<String, dynamic>> getTermesData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.terms,
    );
    return res.data;
  }

//======================================privacy================================

  static Future<Map<String, dynamic>> getPrivacyData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.privacy,
    );
    return res.data;
  }

  //=================================news=======================================
  static Future<Map<String, dynamic>> getAllNewsData({page}) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.news}?page=$page',
    );
    return res.data;
  }

  static Future<Map<String, dynamic>> getSingleNewsData(
    id,
  ) async {
    var res = await DioHelper.getData(
      url: '${ApiEndPoints.news}/$id',
    );
    return res.data;
  }
  //===========================get user notifications======================

  static Future<Map<String, dynamic>> getUserNotifications() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.getNotifications, token: 'Bearer ${Constants.token}');
    return res.data;
  }
  //==================mark notification as readed=================

  static Future<Map<String, dynamic>> markNotificationAsReaded(
      notificationId) async {
    var res = await DioHelper.getData(
        url: '${ApiEndPoints.readNotification}/$notificationId',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  //===============user logOut====================
  static Future<Map<String, dynamic>> userLogOut() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.logout, token: 'Bearer ${Constants.token}');
    return res.data;
  }
}
