part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  GetStatus getStatus;
  LoginSuccess(this.getStatus);
}

class LoginFail extends LoginState {}
