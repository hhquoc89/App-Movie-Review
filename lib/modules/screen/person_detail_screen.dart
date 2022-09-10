import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/screen/appbar/appbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/dropbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_person_detail/bio.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_person_detail/header.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_person_detail/infor.dart';

import 'pannel_home/pannel_footer.dart';

class PersonDetailScreen extends StatefulWidget {
  num? personId;
  PersonDetailScreen({Key? key, required this.personId}) : super(key: key);

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: ListView(
        children: [
          DropBar(),
          Header(),
          Info(),
          Bio(),
          PannelFooter(),
        ],
      ),
    );
  }
}
