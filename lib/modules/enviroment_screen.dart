import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_boilerplate/modules/screen/appbar/appbar.dart';

import 'package:flutter_boilerplate/modules/screen/home_screen.dart';
import 'package:flutter_boilerplate/modules/screen/drawer_screen.dart';


class EnvironmentScreen extends StatefulWidget {
  const EnvironmentScreen({Key? key}) : super(key: key);

  @override
  State<EnvironmentScreen> createState() => _EnvironmentScreenState();
}

class _EnvironmentScreenState extends State<EnvironmentScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: const HomeScreen(),
      drawer: DrawerScreen(),
    );
  }
}
