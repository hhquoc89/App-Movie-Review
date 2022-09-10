part of 'auth_cubit.dart';

abstract class AuthState {
  const AuthState();
}

class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  bool isLogin;
  String user;
  AuthSuccess(this.isLogin, this.user);
}

class UnAuth extends AuthState {}
