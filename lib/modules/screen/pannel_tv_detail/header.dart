import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  Header({Key? key}) : super(key: key);

  covertDatetime() {
    final _releaseDate = tvDetailModel.firstAirDate ?? '2013-04-20';
    final dump = DateTime.parse(_releaseDate);
    final DateFormat formatter = DateFormat('y');
    final String formatted = formatter.format(dump);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    final appCubit = context.read<AppCubit>();
    return Container(
      height: 30,
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              tvDetailModel.name ?? '',
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
