import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:intl/intl.dart';

class Genre extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  Genre({Key? key}) : super(key: key);

  @override
  covertRuntime() {
    final _runtime = tvDetailModel.episodeRunTime ?? [1];
    if (_runtime != []) {
      num hour = _runtime.first ~/ 60;
      num min = _runtime.first % 60;
      String _convertRuntime = '';
      if (hour > 0) {
        return _convertRuntime = '$hour' 'h' '$min';
      } else {
        return _convertRuntime = '$min';
      }
    } else {
      return _runtime.length.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    List<Genres> _genres = [];

    return Container(
      padding: const EdgeInsets.all(8),
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          _genres.addAll(tvDetailModel.genres ?? []);
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
                      const SizedBox(
                        width: 5,
                      ),
                      Text('\u2022 ' + covertRuntime() + 'm',
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
