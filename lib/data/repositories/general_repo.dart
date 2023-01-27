

import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';

class GeneralRepositories {
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
      
      url:'${ ApiEndPoints.news}?page=$page',
    );
    return res.data;
  }
 static Future<Map<String, dynamic>> getSingleNewsData(id,) async {
    var res = await DioHelper.getData(
      
      url:'${ ApiEndPoints.news}/$id',
    );
    return res.data;
  }
}
