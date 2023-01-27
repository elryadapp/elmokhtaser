import 'package:dio/dio.dart';
import 'package:elmokhtaser/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
String? getExptionMessageMessage(e) {
  if (e is DioError) {
    if (e.type == DioErrorType.other) {
      return LocaleKeys.error_No_internet_connection.tr();
    }
    if (e.response?.statusCode == 508) {
      return LocaleKeys.error_toomantrequest.tr();
    }
    if (e.response?.statusCode == 404) {
      return e.response?.data["message"].toString()??
          LocaleKeys.error_Internal_Server_Error.tr();
    }
     if (e.response?.statusCode == 403) {
      return e.response?.data["message"] ;
    }
    if (e.response?.statusCode == 500) {
      return LocaleKeys.error_Internal_Server_Error.tr();
    }
    if (e.response?.statusCode == 422) return e.response?.data["message"][0];
    if (e.response?.data["message"] != null) return e.response?.data["message"];
  }
   else if (e is FormatException) {
    return "CustomFormatExption";
  } else {
    debugPrint("------------------error--------------");
    debugPrint(e.toString());
    if (e.toString().contains("is not a subtype")) return "Model error";
    return e.toString();
  }
  return null;
}
