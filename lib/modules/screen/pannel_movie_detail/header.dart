import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  late MovieDetailCubit movieDetailCubit;
  MovieDetailModel movieDetailModel = MovieDetailModel();
  Header({Key? key}) : super(key: key);

  covertDatetime() {
    final _releaseDate = movieDetailModel.releaseDate ?? '2013-04-20';
    final dump = DateTime.parse(_releaseDate);
    final DateFormat formatter = DateFormat('y');
    final String formatted = formatter.format(dump);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    movieDetailCubit = MovieDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    movieDetailCubit.getMovieDetail(args.id);
    final appCubit = context.read<AppCubit>();
    return Container(
      height: 30,
      child: BlocConsumer(
        bloc: movieDetailCubit,
        listener: (context, state) {
          if (state is MovieDetailSuccess) {
            movieDetailModel = state.movieDetailModel;
          }
        },
        builder: (context, state) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              movieDetailModel.title ?? '',
              style: appCubit.styles.customMovieDetailTitle(),
            ),
            Text(
              '(' + covertDatetime() + ')',
              style: appCubit.styles.customOptionDark(),
            ),
          ]);
        },
      ),
    );
  }
}
