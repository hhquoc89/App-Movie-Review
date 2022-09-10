import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:intl/intl.dart';

class Genre extends StatelessWidget {
  late MovieDetailCubit movieDetailCubit;
  MovieDetailModel movieDetailModel = MovieDetailModel();
  Genre({Key? key}) : super(key: key);
  @override
  covertDatetime() {
    final _releaseDate = movieDetailModel.releaseDate ?? '2013-04-20';
    final dump = DateTime.parse(_releaseDate);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(dump);
    return formatted;
  }

  covertRuntime() {
    final _runtime = movieDetailModel.runtime ?? 0;
    num hour = _runtime ~/ 60;
    num min = _runtime % 60;
    String _convertRuntime = '$hour' 'h' '$min';
    return _convertRuntime;
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    movieDetailCubit = MovieDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    movieDetailCubit.getMovieDetail(args.id);
    List<Genres> _genres = [];

    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocConsumer(
        bloc: movieDetailCubit,
        listener: (context, state) {
          if (state is MovieDetailSuccess) {
            movieDetailModel = state.movieDetailModel;
          }
        },
        builder: (context, state) {
          _genres.addAll(movieDetailModel.genres ?? []);
          return Center(
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey)),
                        child: const Text(
                          'PG-13',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        covertDatetime(),
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text('\u2022 ' + covertRuntime(),
                          style: const TextStyle(fontSize: 16))
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 50,
                  child: Center(
                    child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => const Text(', '),
                        itemCount: _genres.length,
                        itemBuilder: ((context, index) {
                          final total = _genres[index];
                          return Text(
                            total.name ?? '',
                            style: appCubit.styles.defaultTextStyle(),
                          );
                        })),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
