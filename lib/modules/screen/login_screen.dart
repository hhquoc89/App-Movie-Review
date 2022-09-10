import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/commons/utils/app_colors.dart';
import 'package:flutter_boilerplate/commons/utils/popup_utils.dart';
import 'package:flutter_boilerplate/commons/widgets/app_bar/dialog.dart';
import 'package:flutter_boilerplate/modules/auth/cubit/auth_cubit.dart';
import 'package:flutter_boilerplate/modules/login/cubit/login_cubit.dart';
import 'package:flutter_boilerplate/modules/screen/appbar/appbar.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late LoginCubit loginCubit;
  late AppCubit appCubit;
  late AuthCubit authCubit;
  late SharedPreferences loginData;
  late bool newUser;

  @override
  void initState() {
    super.initState();
    appCubit = context.read<AppCubit>();
    authCubit = context.read<AuthCubit>();
    loginCubit = LoginCubit();
  }
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Form(
        key: _formKey,
        child: Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              Text(
                'Login to your account',
                style: appCubit.styles.customTextStyle3(),
              ),
              const SizedBox(
                height: 10,
              ),
              RichText(
                  text: TextSpan(
                      style: appCubit.styles.defaultTextStyle(),
                      children: [
                    const TextSpan(
                        text:
                            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple.'),
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, RouteName.signUp);
                          },
                        text: ' Click here ',
                        style: const TextStyle(color: AppColors.lightBlue)),
                    const TextSpan(text: 'to get started.')
                  ])),
              const SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      style: appCubit.styles.defaultTextStyle(),
                      children: [
                    const TextSpan(
                        text:
                            'If you signed up but didn\'t get your verification email,'),
                    TextSpan(
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        text: ' Click here ',
                        style: const TextStyle(color: AppColors.lightBlue)),
                    const TextSpan(text: 'to have it resent.')
                  ])),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Username',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: userNameController,
                validator: (username) {
                  if (username!.isEmpty) {
                    return "Enter the valid username";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              const Text('Password ', style: TextStyle(fontSize: 18)),
              const SizedBox(height: 10),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                validator: (password) {
                  if (password!.isEmpty) {
                    return "Enter the valid password";
                  }
                  if (password.length <= 4) {
                    return "Password must have at least 4 character";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  BlocConsumer(
                    bloc: loginCubit,
                    listener: (context, state) async {
                      if (state is LoginSuccess) {
                        loginData = await SharedPreferences.getInstance();
                        loginData.setBool('login', state.getStatus.success!);
                        loginData.setString(
                            'userName', userNameController.text.trim());
                        if (state.getStatus.success == true) {
                          authCubit.emit(AuthSuccess(state.getStatus.success!,
                              userNameController.text.trim()));
                        }
                        Navigator.pop(
                          context,
                          RouteName.event,
                        );
                      } else if (state is LoginFail) {
                        BasicDialog errorDialog = BasicDialog();
                        PopupUtils(context).showAlertDialog(
                            title: 'Error',
                            content: 'Invalid username or password',
                            leftActionContent: 'Ok',
                            actionCallback: (value) {
                              if (value) {
                                print('value');
                              } else {
                                Navigator.pop(context);
                              }
                            },
                            dialog: errorDialog);
                        userNameController.clear();
                        passwordController.clear();
                        print('error');
                        //wiget showdialog
                      }
                    },
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              loginCubit.login(userNameController.text.trim(),
                                  passwordController.text.trim());
                            }
                          },
                          child: const Text('Login'),
                          style: ElevatedButton.styleFrom(
                            primary: AppColors.lightBlue,
                          ));
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Text(
                      'Reset Password',
                      style: TextStyle(color: AppColors.lightBlue),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
