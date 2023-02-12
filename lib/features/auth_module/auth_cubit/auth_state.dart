part of 'auth_cubit.dart';

enum LoginStates { initial, loading, success, failure }

enum RegisterStates { initial, loading, success, failure }

enum VerifyStates { initial, loading, success, failure }

class RegisterVisibilityChangeState extends AuthState {}

class LoginVisibilityChangeState extends AuthState {}

class AuthState {
  int infoIndex;
  bool changetermsState;
  bool registerVisibilityChangeState;
  bool loginVisibilityChangeState;
  final LoginStates loginStates;
  final RegisterStates registerStates;
  final VerifyStates verifyStates;
  final String? exception;
  final UserData? userModel;

  AuthState(
      {this.infoIndex = 0,
      this.changetermsState = false,
      this.registerVisibilityChangeState = false,
      this.loginVisibilityChangeState = false,
      this.loginStates = LoginStates.initial,
      this.registerStates = RegisterStates.initial,
      this.verifyStates = VerifyStates.initial,
      this.exception,
      this.userModel});

  AuthState copyWith({
    int? infoIndex,
    bool? changetermsState,
    bool? registerVisibilityChangeState,
    bool? loginVisibilityChangeState,
    LoginStates? loginStates,
    RegisterStates? registerStates,
    VerifyStates? verifyStates,
    String? exception,
    UserData? userModel,
  }) {
    return AuthState(
        changetermsState: changetermsState ?? this.changetermsState,
        exception: exception ?? this.exception,
        infoIndex: infoIndex ?? this.infoIndex,
        loginStates: loginStates ?? this.loginStates,
        loginVisibilityChangeState:
            loginVisibilityChangeState ?? this.loginVisibilityChangeState,
        registerStates: registerStates ?? this.registerStates,
        registerVisibilityChangeState:
            registerVisibilityChangeState ?? this.registerVisibilityChangeState,
        userModel: userModel ?? this.userModel,
        verifyStates: verifyStates ?? this.verifyStates);
  }
}
