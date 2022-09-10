import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';

class TopBill extends StatelessWidget {
  late MovieDetailCubit movieDetailCubit;
  MovieDetailModel movieDetailModel = MovieDetailModel();
  TopBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    movieDetailCubit = MovieDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    movieDetailCubit.getMovieDetail(args.id);
    return Container(
      alignment: Alignment.topLeft,
      height: 450,
      padding: const EdgeInsets.all(20),
      child: BlocConsumer(
        bloc: movieDetailCubit,
        listener: (context, state) {
          if (state is MovieDetailSuccess) {
            movieDetailModel = state.movieDetailModel;
          }
        },
        builder: (context, state) {
          final casts = movieDetailModel.credits?.cast;
          String url = 'https://image.tmdb.org/t/p/original/';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Top Billed Cast',
                  style: appCubit.styles.customTextStyle3()),
              const SizedBox(height: 10),
              SizedBox(
                height: 320,
                width: 400,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final cast = casts?[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.personDetail,
                              arguments: cast?.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              border:
                                  Border.all(width: 0.7, color: Colors.grey)),
                          width: 120,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(8),
                                    topRight: Radius.circular(8)),
                                child: CachedNetworkImage(
                                  imageUrl: url +
                                      (cast?.profilePath ??
                                          '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                                  placeholder: (context, url) => Center(
                                      child: const CircularProgressIndicator()),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                alignment: Alignment.topLeft,
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      cast?.name ?? '',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(cast?.character ?? ''),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },
                    itemCount: 10),
              ),
              const SizedBox(height: 15),
              Text('Full Cast & Crew',
                  style: appCubit.styles.customTextStyle3()),
            ],
          );
        },
      ),
    );
  }
}
