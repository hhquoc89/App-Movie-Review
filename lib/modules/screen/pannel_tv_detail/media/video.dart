import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';

class Video extends StatefulWidget {
  Video({Key? key}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late TvDetailCubit tvDetailCubit;

  Trailers trailers = Trailers();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTrailersTv(args.id);
    return Container(
      color: Colors.blue,
      height: 250,
      width: 500,
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TrailersTvSuccess) {
            trailers = state.trailers;
          }
        },
        builder: (context, state) {
          String url = 'https://img.youtube.com/vi/';
          final results = trailers.results ?? [];
          return ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final result = results[index];
                return Container(
                  color: Colors.white,
                  width: 300,
                  height: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      CachedNetworkImage(
                        imageUrl: url + (result.key ?? '') + '/0.jpg',
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        fit: BoxFit.cover,
                      ),
                      ClipRRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 0.1,
                          ),
                          child: Container(
                            padding: const EdgeInsets.all(40),
                            color: Colors.grey.withOpacity(0.1),
                            alignment: Alignment.center,
                            height: 100,
                            child: InkWell(
                              child: CircleAvatar(
                                backgroundColor: Colors.grey,
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.black,
                                ),
                              ),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              itemCount: results.length);
        },
      ),
    );
  }
}
