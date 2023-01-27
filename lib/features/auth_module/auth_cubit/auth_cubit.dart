
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/data/models/auth_models/error_model.dart';
import 'package:elmokhtaser/data/models/auth_models/register_data_model.dart';
import 'package:elmokhtaser/data/models/auth_models/user_model.dart';
import 'package:elmokhtaser/data/repositories/auth_repo.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:easy_localization/easy_localization.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  double? animatedWidth;
  void changeAnimatedWidth(context) {
    if (currentInfoIndex == 0) {
      animatedWidth = Constants.getwidth(context) / 2 - 5.w;
    } else {
      animatedWidth = Constants.getwidth(context);
    }
    emit(ChangeInfoIndexState());
  }

  //====================register data========================================
  bool termsState = false;
  void onChangeConditionsAgrree(value) {
    termsState = value;
    emit(ChangetermsState());
  }

  int currentInfoIndex = 0;
  void changeIndex(index, context) {
    currentInfoIndex = index;
    changeAnimatedWidth(context);
    emit(ChangeInfoIndexState());
  }

  final registerBasicInfoFormKey = GlobalKey<FormState>();
  final registerNameController = TextEditingController();
  final registerEmailController = TextEditingController();
  final registerPhoneNumberController = TextEditingController();
  final registerPasswordController = TextEditingController();
  final registerPasswordConfirmController = TextEditingController();
  final registerEducationalLevelController = TextEditingController();
  final registerLevelController = TextEditingController();
  UserData? userModel;
  UserModel? userModelStatus;
  String? verificationCode;
  Future<void> authRegistration(context) async {
    emit(RegisterLoadingState());
    try {
       String? token = await messaging.getToken();
      RegisterDataModel registerDataModel = RegisterDataModel()
        ..name = registerNameController.text
        ..email = registerEmailController.text
        ..googleDeviceToken=token
        ..phone = registerPhoneNumberController.text
        ..password = registerPasswordController.text
        ..passwordConfirm = registerPasswordConfirmController.text
        ..educationLeve = registerEducationalLevelController.text
        ..level = registerLevelController.text;
      var res = await AuthRepositories.authRegister(
          query: registerDataModel.toJson());

      if (res['status'] < 300) {
        userModelStatus = UserModel.fromJson(res);
        userModel = userModelStatus!.data;
        AppUtil.flushbarNotification( 'code_alert'.tr());

        verificationCode = userModelStatus!.data!.code.toString();
        Constants.token = userModel!.token ?? '';

        await CacheHelper.assignData(
            key: 'jwt', value: userModelStatus!.data!.token);
        await CacheHelper.assignData(
            key: 'user_name', value: userModelStatus!.data!.name);

        Navigator.pushReplacementNamed(context, Routes.verification);
        registerNameController.text = '';
        registerEmailController.text = '';
        registerPhoneNumberController.text = '';
        registerPasswordController.text = '';
        registerPasswordConfirmController.text = '';
        registerEducationalLevelController.text = '';
        registerLevelController.text = '';
        emit(RegisterLoadedState());
      } else {
        ErrorModel errorModel = ErrorModel.fromJson(res);
        if (errorModel.data?.email != null) {
          AppUtil.flushbarNotification( errorModel.data?.email![0]);
        } else if (errorModel.data?.name != null) {
          AppUtil.flushbarNotification( errorModel.data?.name![0]);
        } else if (errorModel.data?.password != null) {
          AppUtil.flushbarNotification( errorModel.data?.password![0]);
        } else if (errorModel.data?.phone != null) {
          AppUtil.flushbarNotification( errorModel.data?.phone![0]);
        }
        emit(RegisterErrorState());
      }
    } catch (error) {
      emit(RegisterErrorState());
    }
  }

  bool registerVisibility = true;
  IconData registerVisibilityIcon = Icons.visibility_outlined;

  bool registerVisibilityp = true;
  IconData registerVisibilityIconp = Icons.visibility_outlined;
  void registerChangeVisibility() {
    registerVisibility = !registerVisibility;
    registerVisibilityIcon = !registerVisibility
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(RegisterVisibilityChangeState());
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
    bool loginVisibality = true;

  IconData loginVisibilityIcon = Icons.visibility_outlined;
  void loginChangeVisibility() {
    loginVisibality = !loginVisibality;
    loginVisibilityIcon = !loginVisibality
        ? Icons.visibility_off_outlined
        : Icons.visibility_outlined;
    emit(LoginVisibilityChangeState());
  }




  FirebaseMessaging messaging = FirebaseMessaging.instance;

  final loginEmailController = TextEditingController();
  final loginPasswordController = TextEditingController();
  UserData? userLoginModel;
  UserModel? userLoginModelStatus;
  Future<void> authLogin(context) async {
    emit(LoginLoadingState());
    try {
      String? token = await messaging.getToken();
      RegisterDataModel userLoginModelp = RegisterDataModel()
        ..email = loginEmailController.text
        ..password = loginPasswordController.text
        ..googleDeviceToken=token;

      var res =
          await AuthRepositories.authLogin(query: userLoginModelp.toJson());
      if (res['status'] < 300) {
        userLoginModelStatus = UserModel.fromJson(res);

        userLoginModel = userLoginModelStatus?.data;
        Constants.token = userLoginModel!.token!;

        await CacheHelper.assignData(key: 'jwt', value: userLoginModel!.token);
        await CacheHelper.assignData(
            key: 'user_name', value: userLoginModel!.name);
//  await CartCubit.get(context).getAllCartItems(context);
        Navigator.pushReplacementNamed(context, Routes.layout);
        loginEmailController.text = '';
        loginPasswordController.text = '';
        AppUtil.flushbarNotification( 'login_success'.tr());

        emit(RegisterLoadedState());
      } else {
        AppUtil.flushbarNotification( res['data']);

        emit(LoginErrorState());
      }
    } catch (error) {
      emit(LoginErrorState());
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
   
    if(educationLevel==   'University_stage'.tr()){
        levelsList = ['student'.tr(), 'graduate'.tr()];
    }
      else if(educationLevel== 'High_school'.tr()){
    levelsList = [
         "First_grade_of_high".tr()     ,
         "second_grade_of_high".tr()   ,
        "third_grade_of_high".tr()    ,
        "High_school_graduate".tr()
        ];
      }
      else if(educationLevel==  'Secondary_school'.tr()){
    levelsList = [
          "First_grade_of_secondary".tr(),
          "second_grade_of_secondary".tr(),
          "third_grade_of_secondary".tr(),
        ];
      }
    
else if(educationLevel==  'Primary_school'.tr()){
 
        levelsList = [
         "First_grade_of_Primary".tr(),
        "second_grade_of_Primary".tr(),
        "third_grade_of_Primary".tr(),
        "fourth_grade_of_Primary".tr(),
         "fifth_grade_of_Primary".tr(),
         "sixth_grade_of_Primary".tr()
        ];
}

    else if(educationLevel==  'Kindergarten'.tr()){
 
        levelsList = [
         "First_grade_of_Kindergarten".tr(),
         "second_grade_of_Kindergarten".tr(),
        "third_grade_of_Kindergarten".tr(),
        ];
    }

    
    
  }

  //======================verification Data=================================
  final codeControllers = List.generate(5, (index) => TextEditingController());

  UserData? verifyUserModel;

  Future<void> authVerify(context) async {
    emit(VerifyLoadingState());
    try {
      RegisterDataModel userLoginModelv = RegisterDataModel()
        ..phone = userModel!.phone
        ..code = codeControllers.map((e) => e.text).toList().join();

      var res = await AuthRepositories.authVerification(
        query: userLoginModelv.toJson(),
      );

      if (res['status'] == 200) {
        verifyUserModel = UserData.fromJson(res);
        AppUtil.flushbarNotification( 'login_success'.tr());
        CacheHelper.assignData(key: 'jwt', value: userModelStatus!.data!.token);

        Navigator.pushReplacementNamed(context, Routes.layout);
        emit(VerifyLoadedState());
      } else {
        AppUtil.flushbarNotification( res['data']);

        emit(VerifyErrorState());
      }
    } catch (error) {
      emit(VerifyErrorState());
    }
  }
}
