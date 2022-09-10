import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/commons/utils/app_colors.dart';
import 'package:flutter_boilerplate/modules/auth/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/modules/login/cubit/login_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/user_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  late SharedPreferences loginData;

  late AuthCubit authCubit;
  late bool isLogin;

  String user = '';
  @override
  void initState() {
    isLogin = false;
    authCubit = context.read<AuthCubit>();
    checkAlreadyLogin();
    super.initState();
  }

  Future<void> checkAlreadyLogin() async {
    loginData = await SharedPreferences.getInstance();
    if (loginData.getBool('login') == true) {
      isLogin = true;
      user = loginData.getString('user') ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      listener: (context, state) {
        if (state is AuthSuccess) {
          isLogin = state.isLogin;
          user = state.user;
        }
      },
      bloc: authCubit,
      builder: (context, state) {
        return AppBar(
            centerTitle: true,
            backgroundColor: AppColors.darkBlue,
            title: Center(
              child: InkWell(
                onTap: () => Navigator.pushNamed(context, RouteName.initial),
                child: SvgPicture.asset(
                  'assets/images/logo.svg',
                  width: 30,
                  height: 40,
                  color: AppColors.white,
                ),
              ),
            ),
            actions: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: isLogin
                      ? loginSuccess(user, context, loginData, isLogin)
                      : notLogin(context)),
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, RouteName.search);
                  },
                  icon: const Icon(Icons.search)),
            ]);
      },
    );
  }
}

Widget loginSuccess(String data, BuildContext context,
    SharedPreferences sharedPreferences, bool isLogin) {
  return Center(
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.person,
          color: AppColors.white,
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          switch (value) {
            case "Logout":
              isLogin = !isLogin;
              sharedPreferences.remove('login');
              sharedPreferences.remove('userName');
              Navigator.pop(context, RouteName.event);
              break;
          }
          switch (value) {
            case "Setting":
              Navigator.pushNamed(context, RouteName.login);
              break;
          }
        },
        items: <String>[data, 'Setting', 'Logout']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}

Widget notLogin(BuildContext context) {
  return Center(
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        icon: const Icon(
          Icons.person,
          color: AppColors.white,
        ),
        style: const TextStyle(color: Colors.black),
        onChanged: (value) {
          switch (value) {
            case "Login":
              Navigator.pushNamed(context, RouteName.login);
              break;
          }
          switch (value) {
            case "Sign Up":
              Navigator.pushNamed(context, RouteName.signUp);
              break;
          }
        },
        items: <String>['Login', 'Sign Up', 'Setting']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ),
  );
}
