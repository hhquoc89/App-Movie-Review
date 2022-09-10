import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/home/cubit/home_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:intl/intl.dart';

class PannelTrendingDay extends StatelessWidget {
  late HomeCubit homeCubit;

  List<Results> listResults = [];

  PannelTrendingDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    homeCubit = HomeCubit();
    homeCubit.showTrendingDay();
    return Container(
      alignment: Alignment.topLeft,
      height: 360,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          SizedBox(
            height: 330,
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
                      final mediaType = results;
                      final formatter = DateFormat('MMMM d, y', 'en_US');
                      String formatted = '';
                      bool isReleaseDate = true;
                      final firstAirDate = results.firstAirDate ?? '';
                      final releaseDate = results.releaseDate ?? '';
                      if (releaseDate != '') {
                        isReleaseDate = true;
                      } else {
                        isReleaseDate = false;
                      }
                      if (isReleaseDate == true) {
                        final _releaseDate = DateTime.parse(releaseDate);
                        formatted = formatter.format(_releaseDate);
                      } else {
                        final _firstAirDate = DateTime.parse(firstAirDate);
                        formatted = formatter.format(_firstAirDate);
                      }
                      bool isName = true;
                      String _name = '';
                      final name = results.name ?? '';
                      final title = results.title ?? '';
                      if (name != '') {
                        isName = true;
                      } else {
                        isName = false;
                      }
                      if (isName == true) {
                        _name = name;
                      } else {
                        _name = title;
                      }
                      return InkWell(
                        onTap: () {
                          if (results.mediaType == 'movie') {
                            Navigator.pushNamed(context, RouteName.movieDetail,
                                arguments: results);
                          } else {
                            Navigator.pushNamed(context, RouteName.tvDetail,
                                arguments: results);
                          }
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
                                  isName
                                      ? Text(
                                          _name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Text(_name,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  isReleaseDate
                                      ? Text(formatted)
                                      : Text(formatted),
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
