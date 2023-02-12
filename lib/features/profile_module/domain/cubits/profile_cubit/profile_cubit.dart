import 'dart:io';
import 'package:elmokhtaser/features/profile_module/components/certificate_image.dart';
import 'package:flutter/foundation.dart';
import 'package:screenshot/screenshot.dart';
import 'package:sizer/sizer.dart';
import 'package:elmokhtaser/config/app_routes/app_routes.dart';
import 'package:elmokhtaser/core/network/local/cache_helper.dart';
import 'package:elmokhtaser/core/utils/app_util.dart';
import 'package:pdf/widgets.dart' as pw;

import 'package:elmokhtaser/core/utils/constants.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/error_model.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/user_certificates_model.dart';
import 'package:elmokhtaser/features/auth_module/data/auth_models/user_model.dart';
import 'package:elmokhtaser/features/layout_module/domain/layout_cubit/layout_cubit.dart';
import 'package:elmokhtaser/features/profile_module/data/models/account_model.dart';
import 'package:elmokhtaser/features/profile_module/data/models/coupons_model.dart';
import 'package:elmokhtaser/features/profile_module/data/models/profile_error_model.dart';
import 'package:elmokhtaser/features/profile_module/data/models/user_password_model.dart';
import 'package:elmokhtaser/features/profile_module/data/repo/profile_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:image_picker/image_picker.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileState());
  static ProfileCubit get(context) => BlocProvider.of(context);
  //==========================main profile =======================================
  final formKey = GlobalKey<FormState>();

  void changeLangExpanedState(val) {
    emit(state.copyWith(isLangExpanded: val));
  }

  //=============================account Statemanagement===================

  List<AccountModel> billDetailsList = [
    AccountModel(
        describtion: 'الربح من التسويق بالعمولة',
        date: DateTime.now(),
        type: 'سحب',
        state: 'مؤكد',
        price: '100 ريال'),
    AccountModel(
        describtion: 'الربح من التسويق بالعمولة',
        date: DateTime.now(),
        type: 'سحب',
        state: 'مؤكد',
        price: '100 ريال')
  ];

//==================update user=================

  Future<void> updateUser(context) async {
    UserData updateUserModel = UserData()
      ..method = 'PUT'
      ..name = userNameController.text
      ..phone = userPhoneNumberController.text
      ..email = userEmailController.text;

    emit(state.copyWith(updateUserStates: UpdateUserStates.loading));
    try {
      if (userNameController.text != '' &&
          userPhoneNumberController.text != '' &&
          userEmailController.text != '') {
        var res = await ProfileRepo.updateUserData(profileImage,
            query: updateUserModel.toJson());
        if (res['status'] < 300) {
          AppUtil.flushbarNotification('updated_successfuly'.tr());
          CacheHelper.clearCache(key: 'user_name');
          CacheHelper.assignData(
              key: 'user_name', value: userNameController.text);
          Constants.userName = userNameController.text;
          LayoutCubit.get(context).changeCurrentPageIndex(0);
          Navigator.pushReplacementNamed(
            context,
            Routes.layout,
          );
          emit(state.copyWith(updateUserStates: UpdateUserStates.success));
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
          emit(state.copyWith(updateUserStates: UpdateUserStates.failure));
        }
      } else {
        AppUtil.flushbarNotification('info_alert'.tr());
        emit(state.copyWith(updateUserStates: UpdateUserStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(updateUserStates: UpdateUserStates.failure));
    }
  }

//=================get user=====================
  Future<void> getUserData(context) async {
    emit(state.copyWith(getUserStates: GetUserStates.loading));
    try {
      var res = await ProfileRepo.getUserData();

      var userModel = UserModel.fromJson(res);

      if (res['status'] == null) {
        userNameController.text = userModel.data!.name;
        userEmailController.text = userModel.data!.email;
        userPhoneNumberController.text = userModel.data!.phone!;
        CacheHelper.assignData(key: 'user_name', value: userModel.data!.name);
        emit(state.copyWith(
            getUserStates: GetUserStates.success, userModel: userModel));
      } else {
        AppUtil.flushbarNotification(res['status']);
        emit(state.copyWith(getUserStates: GetUserStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(getUserStates: GetUserStates.failure));
    }
  }
  //====================update user password===============

  Future<void> updateUserPassword(context) async {
    emit(state.copyWith(
        updateUserPasswordStates: UpdateUserPasswordStates.loading));
    PasswordEditingModel passwordEditingModel = PasswordEditingModel()
      ..method = 'PUT'
      ..oldPassword = oldPasswordController.text
      ..newPassword = newPasswordController.text
      ..newPasswordConfirmation = newPasswordController.text;

    try {
      var res = await ProfileRepo.updateUserPassword(
          query: passwordEditingModel.toJson());
      if (res['status'] < 300) {
        AppUtil.flushbarNotification('password_updated_successfully'.tr());
      } else {
        if (res['data'] is String) {
          AppUtil.flushbarNotification(res['data']);
        } else {
          ProfileErrorModel profileErrorModel = ProfileErrorModel.fromJson(res);
          if (profileErrorModel.data!.currentPassword != null) {
            AppUtil.flushbarNotification(
                profileErrorModel.data!.currentPassword![0]);
          } else if (profileErrorModel.data!.newPassword != null) {
            AppUtil.flushbarNotification(
                profileErrorModel.data!.newPassword![0]);
          } else if (profileErrorModel.data!.confirmPassword != null) {
            AppUtil.flushbarNotification(
                profileErrorModel.data!.confirmPassword![0]);
          }
        }
      }
      emit(state.copyWith(
          updateUserPasswordStates: UpdateUserPasswordStates.success));
    } catch (error) {
      emit(state.copyWith(
          updateUserPasswordStates: UpdateUserPasswordStates.failure));
    }
  }

  final passwordEditingFormKey = GlobalKey<FormState>();
//=================user account controllers=================
  final userNameController = TextEditingController();
  final userEmailController = TextEditingController();
  final userPhoneNumberController = TextEditingController();
  final newPasswordController = TextEditingController();
  final oldPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  File? profileImage;
  ImagePicker picker = ImagePicker();
  Future<void> changeImage() async {
    emit(state.copyWith(isProfileImageUploadede: false));

    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(state.copyWith(isProfileImageUploadede: true));
    }
  }

  //================user certificate======================
  Future<void> getUserCertificates(context) async {
    emit(state.copyWith(
        getUserCertificatesStates: GetUserCertificatesStates.loading));
    try {
      var res = await ProfileRepo.getUserCertificate();

      var userCertificateModel = UserCertificatesModel.fromJson(res);

      if (res['data'] != null) {
        emit(state.copyWith(
          getUserCertificatesStates: GetUserCertificatesStates.success,
          userCertificatesModel: userCertificateModel,
        ));
      } else {
        AppUtil.flushbarNotification(res['status']);
        emit(state.copyWith(
            getUserCertificatesStates: GetUserCertificatesStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(
          getUserCertificatesStates: GetUserCertificatesStates.failure));
    }
  }

  List<bool> isNotVisable = List.generate(3, (index) => true);
  void changeVisability(index) {
    isNotVisable[index] = !isNotVisable[index];
    emit(state.copyWith(isVisibalityChanges: !state.isVisibalityChanges));
  }

//=========================get all coupons==================

  Future<void> getAllCoupons() async {
    emit(state.copyWith(getUserCouponsStates: GetUserCouponsStates.loading));
    try {
      var res = await ProfileRepo.getCoupons();

      if (res['status'] < 300) {
        var couponsModel = CouponsModel.fromJson(res);
        emit(state.copyWith(
          getUserCouponsStates: GetUserCouponsStates.success,
          couponsModel: couponsModel,
        ));
      } else {
        AppUtil.appLoader(height: 18.h);
        emit(
            state.copyWith(getUserCouponsStates: GetUserCouponsStates.failure));
      }
    } catch (error) {
      emit(state.copyWith(getUserCouponsStates: GetUserCouponsStates.failure));
    }
  }

  //=====================pdf dir===========================
  Uint8List? imageFile;
  ScreenshotController screenshotController = ScreenshotController();
  Future<void> takeImage(certificateItem) async {
    await screenshotController
        .captureFromWidget(CertificateImage(certificateItem: certificateItem))
        .then((capturedImage) {
      imageFile = capturedImage;
    });
  }

  Future<Uint8List> makeDir(imageFile) async {
    final pdf = pw.Document();
    final image = pw.MemoryImage(imageFile!);

    pdf.addPage(pw.Page(build: (pw.Context context) {
      return pw.Center(
        child: pw.Image(image),
      );
    }));
    return pdf.save();
  }
}
