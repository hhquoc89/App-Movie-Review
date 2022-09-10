import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/screen/movie_detail_screen.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';

class BackGround extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();

  BackGround({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);

    return Container(
      height: 200,
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          String url = 'https://image.tmdb.org/t/p/original/';
          return Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: url +
                    (tvDetailModel.backdropPath ??
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
                          (tvDetailModel.posterPath ??
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
