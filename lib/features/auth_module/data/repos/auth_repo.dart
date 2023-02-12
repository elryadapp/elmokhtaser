import 'package:dio/dio.dart' as dio;
import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:http_parser/http_parser.dart';

class AuthRepositories {
  //=================registeration==================
  static Future<Map<String, dynamic>> authRegister(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.register,
      data: query,
    );
    return res.data;
  }

  //===================login=======================
  static Future<Map<String, dynamic>> authLogin(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
      url: ApiEndPoints.login,
      data: query,
    );
    return res.data;
  }

  //===============verification=====================
  static Future<Map<String, dynamic>> authVerification({
    Map<String, dynamic>? query,
  }) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.verify,
        data: query,
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  //==================user data===========================

  static Future<Map<String, dynamic>> getUserData() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.userData, token: 'Bearer ${Constants.token}');
    return res.data;
  }
  //==================update user=========================

  static Future<Map<String, dynamic>> updateUserData(image,
      {Map<String, dynamic>? query}) async {
    var formData = dio.FormData.fromMap(query!);

    if (image != null) {
      var file = await dio.MultipartFile.fromFile(image!.path,
          filename: image.path.split('/').last,
          contentType: MediaType("image", image.path.split('/').last));

      formData.files.add(MapEntry('image', file));
    }

    var response = await DioHelper.postData(
        token: 'Bearer ${Constants.token}',
        url: ApiEndPoints.userUpdate,
        data: formData);
    return response.data;
  }

  //===============user certificates====================
  static Future<Map<String, dynamic>> getUserCertificate() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.userCertificates, token: 'Bearer ${Constants.token}');
    return res.data;
  }

  //=====================update password===================
  static Future<Map<String, dynamic>> updateUserPassword(
      {Map<String, dynamic>? query}) async {
    var res = await DioHelper.postData(
        url: ApiEndPoints.userUpdatePassword,
        data: query,
        token: 'Bearer ${Constants.token}');
    return res.data;
  }

  //==================get user coupons=====================
  static Future<Map<String, dynamic>> getCoupons() async {
    var res = await DioHelper.getData(
        url: ApiEndPoints.userCoupons, token: 'Bearer ${Constants.token}');
    return res.data;
  }
}
