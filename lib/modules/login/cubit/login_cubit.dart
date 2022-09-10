import 'package:bloc/bloc.dart';
import 'package:flutter_boilerplate/modules/auth/cubit/auth_cubit.dart';

import 'package:flutter_boilerplate/modules/respositories/user_repositories.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  UserRepositories userRepositories = UserRepositories();

  LoginCubit() : super(LoginInitial());

  void login(String userName, String password) async {
    try {
      final token = await userRepositories.getToken();
      print('Token :' + token);
      final response = await userRepositories.login(
        userName,
        password,
        token,
      );
      if (response != null) {
        emit(LoginSuccess(response));
      } else {
        emit(LoginFail());
      }
    } catch (e) {
      emit(LoginFail());
    }
  }

  void logout() async {}
}
