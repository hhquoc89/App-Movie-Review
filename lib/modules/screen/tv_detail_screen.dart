import 'package:flutter/material.dart';

import 'package:flutter_boilerplate/modules/screen/appbar/appbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/background.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/collection.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/dropbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/current_season.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/genre.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/header.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/overview.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/recommendation.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/second_header.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/social/social.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/topbill.dart';

import 'pannel_home/pannel_footer.dart';
import 'pannel_tv_detail/recommendation.dart';
import 'pannel_tv_detail/media/media.dart';

class TVDetailScreen extends StatefulWidget {
  num? movieId;
  TVDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  State<TVDetailScreen> createState() => _TVDetailScreenState();
}

class _TVDetailScreenState extends State<TVDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(),
        body: ListView(
          children: [
            DropBar(),
            BackGround(),
            const SizedBox(
              height: 20,
            ),
            Header(),
            const SizedBox(
              height: 10,
            ),
            SecondHeader(),
            Genre(),
            Overview(),
            TopBill(),
            CurrentSeason(),
            Social(),
            Media(),
            Collection(),
            Recommendation(),
            PannelFooter(),
          ],
        ));
  }
}
