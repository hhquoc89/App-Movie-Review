import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

class BackGround extends StatelessWidget {
  late MovieDetailCubit movieDetailCubit;
  MovieDetailModel movieDetailModel = MovieDetailModel();

  BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movieDetailCubit = MovieDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    movieDetailCubit.getMovieDetail(args.id);

    return Container(
      height: 200,
      child: BlocConsumer(
        bloc: movieDetailCubit,
        listener: (context, state) {
          if (state is MovieDetailSuccess) {
            movieDetailModel = state.movieDetailModel;
          }
        },
        builder: (context, state) {
          String url = 'https://image.tmdb.org/t/p/original/';
          return Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: url +
                    (movieDetailModel.backdropPath ??
                        '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                placeholder: (context, url) =>
                    Center(child: const CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: 0.1,
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(40),
                    color: Colors.grey.withOpacity(0.1),
                    alignment: Alignment.topLeft,
                    height: 100,
                    child: Image.network(
                      url +
                          (movieDetailModel.posterPath ??
                              '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
