import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';

class TopBill extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  TopBill({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    return Container(
      alignment: Alignment.topLeft,
      height: 450,
      padding: const EdgeInsets.all(20),
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          final casts = tvDetailModel.credits?.cast ?? [];
          String url = 'https://image.tmdb.org/t/p/original/';
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Series Cast', style: appCubit.styles.customTextStyle3()),
              const SizedBox(height: 10),
              SizedBox(
                height: 320,
                width: 400,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final cast = casts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.personDetail,
                              arguments: cast.id);
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
                                      (cast.profilePath ??
                                          '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                                  placeholder: (context, url) => const Center(
                                      child: CircularProgressIndicator()),
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
                                      cast.name ?? '',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(cast.character ?? ''),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      tvDetailModel.numberOfEpisodes
                                              .toString() +
                                          ' Episodes',
                                      style:
                                          const TextStyle(color: Colors.grey),
                                    ),
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
                    itemCount: casts.length),
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
