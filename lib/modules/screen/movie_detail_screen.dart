import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';

import 'package:flutter_boilerplate/modules/screen/appbar/appbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/background.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/collection.dart';

import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/dropbar.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/genre.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/header.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/overview.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/recommendation.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/second_header.dart';

import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/social/social.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/topbill.dart';

import 'pannel_home/pannel_footer.dart';
import 'pannel_movie_detail/media/media.dart';

class MovieDetailScreen extends StatefulWidget {
  num? movieId;
  MovieDetailScreen({Key? key, required num? this.movieId}) : super(key: key);

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
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
            Social(),
            Media(),
            Collection(),
            Recommendation(),
            PannelFooter(),
          ],
        ));
  }
}
