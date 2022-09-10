import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/home/cubit/home_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:intl/intl.dart';

class PannelPopularMovie extends StatelessWidget {
  // required variable

  late HomeCubit homeCubit;

  List<Results> listResults = [];

  PannelPopularMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeCubit = HomeCubit();
    homeCubit.showPopularTheater();
    return Container(
      alignment: Alignment.topLeft,
      height: 395,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 350,
            width: 500,
            child: BlocConsumer(
              bloc: homeCubit,
              listener: (context, state) {
                if (state is HomeSuccess) {
                  listResults = state.listResults;
                }
              },
              builder: (context, state) {
                return ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final results = listResults[index];

                      final DateTime releaseDate =
                          DateTime.parse(results.releaseDate ?? '');
                      final DateFormat formatter =
                          DateFormat('MMMM d, y', 'en_US');
                      final String formatted = formatter.format(releaseDate);
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RouteName.movieDetail,
                              arguments: results);
                        },
                        child: Container(
                          width: 120,
                          height: 200,
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8.0),
                                child: Image.network(
                                  'https://image.tmdb.org/t/p/w300' +
                                      (results.posterPath ?? ''),
                                  width: 120,
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    results.title ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text(formatted),
                                ],
                              ),
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
                    itemCount: listResults.length);
              },
            ),
          ),
        ],
      ),
    );
  }
}
