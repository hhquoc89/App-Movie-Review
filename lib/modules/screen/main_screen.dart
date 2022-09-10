import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/respositories/user_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          InkWell(
              child: Icon(Icons.logout),
              onTap: () async {
                Navigator.popAndPushNamed(context, RouteName.event);
              })
        ],
        title: Text('hi'),
      ),
      body: Center(child: Text('Hi! ')),
    );
  }
}
