import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/error_model.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/register_data_model.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/user_model.dart';
import 'package:elmokhtaser/features/auth_module/data/repos/auth_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState());
  static AuthCubit get(context) => BlocProvider.of(context);
  double? animatedWidth;

  //====================register data========================================
  void onChangeConditionsAgrree(value) {
    emit(state.copyWith(changetermsState: value));
  }

  void changeIndex(index, context) {
    emit(state.copyWith(infoIndex: index));
    if (state.infoIndex == 0) {
      animatedWidth = Constants.getwidth(context) / 2 - 5.w;
    } else {
      animatedWidth = Constants.getwidth(context);
    }
  }

  final registerBasicInfoFormKey = GlobalKey<FormState>();
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPhoneNumberController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerPasswordConfirmController = TextEditingController();
  final registerEducationalLevelController = TextEditingController();
  final registerLevelController = TextEditingController();
  String? verificationCode;
  Future<void> authRegistration(context) async {
    emit(state.copyWith(registerStates: RegisterStates.loading));
    try {
      String? token = await messaging.getToken();
      RegisterDataModel registerDataModel = RegisterDataModel()
        ..name = registerNameController.text
        ..email = registerEmailController.text
        ..googleDeviceToken = token
        ..phone = registerPhoneNumberController.text
        ..password = registerPasswordController.text
        ..passwordConfirm = registerPasswordConfirmController.text
        ..educationLeve = registerEducationalLevelController.text
        ..level = registerLevelController.text;
      var res = await AuthRepositories.authRegister(
          query: registerDataModel.toJson());

      if (res['status'] < 300) {
        var userModelStatus = UserModel.fromJson(res);
        AppUtil.flushbarNotification('code_alert'.tr());

        verificationCode = userModelStatus.data!.code.toString();
        Constants.token = userModelStatus.data!.token ?? '';

        await CacheHelper.assignData(
            key: 'jwt', value: userModelStatus.data!.token);
        await CacheHelper.assignData(
            key: 'user_name', value: userModelStatus.data!.name);

        Navigator.pushReplacementNamed(context, Routes.verification);
        registerNameController.text = '';
        registerEmailController.text = '';
        registerPhoneNumberController.text = '';
        registerPasswordController.text = '';
        registerPasswordConfirmController.text = '';
        registerEducationalLevelController.text = '';
        registerLevelController.text = '';
        emit(state.copyWith(
            registerStates: RegisterStates.success,
            userModel: userModelStatus.data));
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(res);
        if (errorModel.data?.email != null) {
          AppUtil.flushbarNotification(errorModel.data?.email![0]);
        } else if (errorModel.data?.name != null) {
          AppUtil.flushbarNotification(errorModel.data?.name![0]);
        } else if (errorModel.data?.password != null) {
          AppUtil.flushbarNotification(errorModel.data?.password![0]);
        } else if (errorModel.data?.phone != null) {
          AppUtil.flushbarNotification(errorModel.data?.phone![0]);
        }
        emit(state.copyWith(registerStates: RegisterStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(registerStates: RegisterStates.failure));
    }
  }

  IconData registerVisibilityIcon = Icons.visibility_outlined;

  bool registerVisibilityp = true;
  IconData registerVisibilityIconp = Icons.visibility_outlined;
  void registerChangeVisibility() {
    state.registerVisibilityChangeState = !state.registerVisibilityChangeState;

    registerVisibilityIcon = state.registerVisibilityChangeState
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(state.copyWith(
        registerVisibilityChangeState: !state.registerVisibilityChangeState));
  }

  void registerChangeVisibilityp() {
    registerVisibilityp = !registerVisibilityp;
    registerVisibilityIconp = !registerVisibilityp
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterVisibilityChangeState());
  }

//=======================login================================
  final loginFormKey = GlobalKey<FormState>();

  IconData loginVisibilityIcon = Icons.visibility_outlined;
  void loginChangeVisibility() {
    state.loginVisibilityChangeState = !state.loginVisibilityChangeState;
    loginVisibilityIcon = state.loginVisibilityChangeState
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(state.copyWith(
        loginVisibilityChangeState: state.loginVisibilityChangeState));
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  Future<void> authLogin(context) async {
    emit(state.copyWith(loginStates: LoginStates.loading));
    try {
      String? token = await messaging.getToken();
      RegisterDataModel userLoginModelp = RegisterDataModel()
        ..email = loginEmailController.text
        ..password = loginPasswordController.text
        ..googleDeviceToken = token;

      var res =
          await AuthRepositories.authLogin(query: userLoginModelp.toJson());
      if (res['status'] < 300) {
        var userLoginModelStatus = UserModel.fromJson(res);
        Constants.token = userLoginModelStatus.data!.token!;

        await CacheHelper.assignData(
            key: 'jwt', value: userLoginModelStatus.data!.token!);
        await CacheHelper.assignData(
            key: 'user_name', value: userLoginModelStatus.data!.name);
        Navigator.pushReplacementNamed(context, Routes.layout);
        loginEmailController.text = '';
        loginPasswordController.text = '';
        AppUtil.flushbarNotification('login_success'.tr());

        emit(state.copyWith(
            loginStates: LoginStates.success,
            userModel: userLoginModelStatus.data));
      } else {
        AppUtil.flushbarNotification(res['data']);

        emit(state.copyWith(loginStates: LoginStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(loginStates: LoginStates.failure));
    }
  }

  //=======================complete info========================
  List<String> educationLevelList = [
    'University_stage'.tr(),
    'High_school'.tr(),
    'Secondary_school'.tr(),
    'Primary_school'.tr(),
    'Kindergarten'.tr()
  ];
  List<String> levelsList = [];
  void getLevelList(educationLevel) {
    if (educationLevel == 'University_stage'.tr()) {
      levelsList = ['student'.tr(), 'graduate'.tr()];
    } else if (educationLevel == 'High_school'.tr()) {
      levelsList = [
        "First_grade_of_high".tr(),
        "second_grade_of_high".tr(),
        "third_grade_of_high".tr(),
        "High_school_graduate".tr()
      ];
    } else if (educationLevel == 'Secondary_school'.tr()) {
      levelsList = [
        "First_grade_of_secondary".tr(),
        "second_grade_of_secondary".tr(),
        "third_grade_of_secondary".tr(),
      ];
    } else if (educationLevel == 'Primary_school'.tr()) {
      levelsList = [
        "First_grade_of_Primary".tr(),
        "second_grade_of_Primary".tr(),
        "third_grade_of_Primary".tr(),
        "fourth_grade_of_Primary".tr(),
        "fifth_grade_of_Primary".tr(),
        "sixth_grade_of_Primary".tr()
      ];
    } else if (educationLevel == 'Kindergarten'.tr()) {
      levelsList = [
        "First_grade_of_Kindergarten".tr(),
        "second_grade_of_Kindergarten".tr(),
        "third_grade_of_Kindergarten".tr(),
      ];
    }
  }

  //======================verification Data=================================
  final codeControllers = List.generate(5, (index) => TextEditingController());

  Future<void> authVerify(context) async {
    emit(state.copyWith(verifyStates: VerifyStates.loading));
    try {
      Constants.token = await CacheHelper.getData(key: 'jwt');
      RegisterDataModel userLoginModelv = RegisterDataModel()
        ..phone = state.userModel!.phone
        ..code = codeControllers.map((e) => e.text).toList().join();

      var res = await AuthRepositories.authVerification(
        query: userLoginModelv.toJson(),
      );

      if (res['status'] == 200) {
        var verifyUserModel = UserData.fromJson(res);
        AppUtil.flushbarNotification('login_success'.tr());
        CacheHelper.assignData(key: 'jwt', value: Constants.token);

        Navigator.pushReplacementNamed(context, Routes.layout);
        emit(state.copyWith(
            verifyStates: VerifyStates.success, userModel: verifyUserModel));
      } else {
        AppUtil.flushbarNotification(res['data']);

        emit(state.copyWith(verifyStates: VerifyStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(verifyStates: VerifyStates.failure));
    }
  }
}
