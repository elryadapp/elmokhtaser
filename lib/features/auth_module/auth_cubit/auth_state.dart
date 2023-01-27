part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}
class ChangeInfoIndexState extends AuthState {}
class ChangetermsState extends AuthState {}

//==================registration states==============

class RegisterLoadingState extends AuthState {}
class RegisterLoadedState extends  AuthState {}
class RegisterErrorState extends   AuthState {}
class RegisterVisibilityChangeState extends   AuthState {}


//==================login states==============================
class LoginVisibilityChangeState extends   AuthState {}
class LoginLoadingState extends AuthState {}
class LoginLoadedState extends  AuthState {}
class LoginErrorState extends   AuthState {}

//=======================verify states======================
class VerifyLoadingState extends AuthState {}
class VerifyLoadedState extends  AuthState {}
class VerifyErrorState extends   AuthState {}