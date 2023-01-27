import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class Constants {
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getwidth(context) => MediaQuery.of(context).size.width;
  static String token = CacheHelper.getData(key: 'jwt') ?? '';
  static String userName = CacheHelper.getData(key: 'user_name')??'';
  static String lang = CacheHelper.getData(key: 'lang')??'ar';
}
