part of 'profile_cubit.dart';

enum GetUserStates { initial, loading, success, failure }

enum UpdateUserStates { initial, loading, success, failure }

enum GetUserCertificatesStates { initial, loading, success, failure }

enum UpdateUserPasswordStates { initial, loading, success, failure }

enum GetUserCouponsStates { initial, loading, success, failure }

class ProfileState {
  final String? exception;
  final GetUserStates getUserStates;
  final GetUserCouponsStates getUserCouponsStates;
  final UpdateUserStates updateUserStates;
  final UpdateUserPasswordStates updateUserPasswordStates;
  final GetUserCertificatesStates getUserCertificatesStates;
  final bool isAnswerChanged;
  final bool isProfileImageUploadede;
  final bool isVisibalityChanges;
  final bool isLangExpanded;
  final UserModel? userModel;
  final CouponsModel? couponsModel;
  final UserCertificatesModel? userCertificatesModel;

  ProfileState({
    this.exception,
    this.getUserStates = GetUserStates.initial,
    this.getUserCouponsStates = GetUserCouponsStates.initial,
    this.updateUserStates = UpdateUserStates.initial,
    this.updateUserPasswordStates = UpdateUserPasswordStates.initial,
    this.getUserCertificatesStates = GetUserCertificatesStates.initial,
    this.isAnswerChanged = false,
    this.isProfileImageUploadede = false,
    this.isVisibalityChanges = false,
    this.isLangExpanded = false,
    this.userModel,
    this.couponsModel,
    this.userCertificatesModel,
  });
  ProfileState copyWith({
    String? exception,
    GetUserStates? getUserStates,
    GetUserCouponsStates? getUserCouponsStates,
    UpdateUserStates? updateUserStates,
    UpdateUserPasswordStates? updateUserPasswordStates,
    GetUserCertificatesStates? getUserCertificatesStates,
    bool? isAnswerChanged,
    bool? isProfileImageUploadede,
    bool? isVisibalityChanges,
    bool? isLangExpanded,
    UserModel? userModel,
    CouponsModel? couponsModel,
    UserCertificatesModel? userCertificatesModel,
  }) {
    return ProfileState(
      exception: exception ?? this.exception,
      couponsModel: couponsModel ?? this.couponsModel,
      getUserCertificatesStates:
          getUserCertificatesStates ?? this.getUserCertificatesStates,
      getUserCouponsStates: getUserCouponsStates ?? this.getUserCouponsStates,
      getUserStates: getUserStates ?? this.getUserStates,
      isAnswerChanged: isAnswerChanged ?? this.isAnswerChanged,
      isLangExpanded: isLangExpanded ?? this.isLangExpanded,
      isProfileImageUploadede:
          isProfileImageUploadede ?? this.isProfileImageUploadede,
      isVisibalityChanges: isVisibalityChanges ?? this.isVisibalityChanges,
      updateUserPasswordStates:
          updateUserPasswordStates ?? this.updateUserPasswordStates,
      updateUserStates: updateUserStates ?? this.updateUserStates,
      userCertificatesModel:
          userCertificatesModel ?? this.userCertificatesModel,
      userModel: userModel ?? this.userModel,
    );
  }
}
