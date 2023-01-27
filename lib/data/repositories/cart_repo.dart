

import 'package:elmokhtaser/core/network/remote/dio_helper.dart';
import 'package:elmokhtaser/core/network/remote/end_points.dart';
import 'package:elmokhtaser/core/utils/constants.dart';

class CartRepositories{
  //===================get cart items================
    static Future<Map<String, dynamic>> getCartItems() async {
    var res = await DioHelper.getData(
      
      url: ApiEndPoints.getCartItems,
     token:'Bearer ${Constants.token}'

    );
    return res.data;
  }

  //===============delete from cart==============
      static Future<Map<String, dynamic>> deleteCartItems(cartItemId) async {
    var res = await DioHelper.deleteData(
      
      url: '${ApiEndPoints.deleteFromCart}/$cartItemId',
     token:'Bearer ${Constants.token}'

    );
    return res.data;
  }

  //========================add to cart==============
      static Future<Map<String, dynamic>> addToCart(courseId) async {
    var res = await DioHelper.getData(
      
      url: '${ApiEndPoints.addToCart}/$courseId',
     token:'Bearer ${Constants.token}'

    );
    return res.data;
  }

  
  //=====================send user coupon===================

    static Future<Map<String, dynamic>> sendCoupons(courseId,couponCode) async {
    var res = await DioHelper.getData(
        url:'${ApiEndPoints.couponDetails}/$courseId/$couponCode',
        token: 'Bearer ${Constants.token}');
    return res.data;
  }



}