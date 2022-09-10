import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/media/backdrop.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/media/mostPopular.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_movie_detail/media/posters.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_tv_detail/media/video.dart';

class Media extends StatefulWidget {
  late String output;
  Media({Key? key}) : super(key: key);

  @override
  State<Media> createState() => _MediaState();
}

class _MediaState extends State<Media> {
  String option = 'video';

  @override
  void initState() {
    // TODO: implement initState

    switch (option) {
      case 'video':
        Video();
        break;
      case 'mostPopular':
        MostPopular();
        break;
      case 'poster':
        Poster();
        break;
      case 'backdrop':
        BackDrop();
        break;
      default:
        'video';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      width: 360,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 80,
              child: Text(
                'Media',
                style: appCubit.styles.customTextStyle3(),
              ),
            ),
            Container(
              width: 230,
              height: 91,
              child: Wrap(
                alignment: WrapAlignment.end,
                direction: Axis.horizontal,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        option = 'video';
                      });
                    },
                    child: Container(
                      child: const Text(
                        'Video',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        option = "mostPopular";
                      });
                    },
                    child: Container(
                      child: const Text(
                        'Most Popular',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        option = 'poster';
                      });
                    },
                    child: Container(
                      child: const Text(
                        'Poster',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        option = 'backdrop';
                      });
                    },
                    child: Container(
                      child: const Text(
                        'Backdrops',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        option == 'video'
            ? Video()
            : option == 'mostPopular'
                ? MostPopular()
                : option == 'poster'
                    ? Poster()
                    : option == 'backdrop'
                        ? BackDrop()
                        : Video(),
      ]),
    );
  }
}
