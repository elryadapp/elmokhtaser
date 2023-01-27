
import 'package:dio/dio.dart' as dio;
import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';


import 'package:http_parser/http_parser.dart';

class PaymentRepositories {
  //=============================bank payment methode==========================
  static Future<Map<String, dynamic>> bankPaymentMethod(
      {Map<String, dynamic>? query, image}) async {

    var formData = dio.FormData.fromMap(query!);

    var file = await dio.MultipartFile.fromFile(image!.path,
        filename: image.path.split('/').last,
        contentType: MediaType("image", image.path.split('/').last));

    formData.files.add(MapEntry('image', file));

    var response = await DioHelper.postData(
        token: 'Bearer ${Constants.token}',
        url: ApiEndPoints.sendCart,
        data: formData);
    return response.data;


  }

  //===================get all banks=====================
  static Future<Map<String, dynamic>> getBanksData() async {
    var res = await DioHelper.getData(
      url: ApiEndPoints.banks,
    );
    return res.data;
  }

  //======================================================
  // static Future<Map<String, dynamic>?> bankPaymentMethod(
  //     Map<String, String> formData, image) async {
  //   var header = {
  //     "Accept": 'application/json',
  //     "Authorization": "Bearer ${Constants.token}",
  //     'lang':   Constants.lang,
  //   };
  //   var request = http.MultipartRequest(
  //       "POST", Uri.parse(ApiEndPoints.baseUrl + ApiEndPoints.sendCart));
  //   request.headers.addAll(header);
  //   if (image != "") {
  //     var multipartFileSign =
  //         await http.MultipartFile.fromPath("image", image!.path);
  //     request.files.add(multipartFileSign);
  //   }
  //   request.fields.addAll(formData);
  //   var response = await request.send();
  //   final respStr = await response.stream.bytesToString();
  //   print("res$respStr");
  //   Map<String, dynamic> mapResponse = await json.decode(respStr);
  //   return mapResponse;
  // }
}
