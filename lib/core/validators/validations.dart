
import 'package:easy_localization/easy_localization.dart';
import 'package:elmokhtaser/generated/locale_keys.g.dart';
class AppValidations {
  static bool emailRegExp(email) => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
  static emailValidation(String email) => email.isEmpty
      ? LocaleKeys.AuthWords_PleaseEnterEmail.tr()
      : !emailRegExp(email)
          ? LocaleKeys.AuthWords_PleaseEnterValidEmail.tr()
          : null;
  static nameValidation(String name) => name.isEmpty
      ? ('${LocaleKeys.AuthWords_PleaseEnter.tr()} ${LocaleKeys.AuthWords_FullName.tr()}')
      : name.length < 5
          ? LocaleKeys.name_is_short.tr()
          
                  : !RegExp(r"^[a-zA-Z0-9-\u0621-\u064A0]").hasMatch(name)
                      ? LocaleKeys.AuthWords_PleaseValidName.tr()
                      : null;

  static password(String password) => password.isEmpty
      ? LocaleKeys.AuthWords_PleaseEnterPassword.tr()
      : password.length < 8
          ? LocaleKeys.AuthWords_pleaseEnterValidPassword.tr()
          : null;
  static confirmPasswordvalidation(String password, String confirmPassword) =>
      confirmPassword.isEmpty
          ? LocaleKeys.AuthWords_PleaseEnterPassword.tr()
          : password != confirmPassword
              ? LocaleKeys.AuthWords_passwordNotMatched.tr()
              : null;
  static phoneValidation(String phone) {
    String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = RegExp(patttern);
    if (phone.isEmpty) {
      return '${LocaleKeys.AuthWords_PleaseEnter.tr()}  ${LocaleKeys.Phone.tr()}';
    } else if (!regExp.hasMatch(phone)) {
      return LocaleKeys.AuthWords_PleaseEnterPhoneForValid.tr();
    }
  }
}
