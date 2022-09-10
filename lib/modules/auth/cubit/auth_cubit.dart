import 'package:bloc/bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  isLoginOrNot() {
    final isLogin = false;
    final user = '';
    if (isLogin == true) {
      emit(AuthSuccess(isLogin, user));
    }
    emit(UnAuth());
  }
}
