import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:intl/intl.dart';

class CurrentSeason extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  CurrentSeason({Key? key}) : super(key: key);
  covertDatetime() {
    final _releaseDate = tvDetailModel.firstAirDate ?? '2013-04-20';
    final dump = DateTime.parse(_releaseDate);
    final DateFormat formatter = DateFormat.yMMMMd('en_US');
    final String formatted = formatter.format(dump);
    return formatted;
  }

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    final appCubit = context.read<AppCubit>();
    final seasons = tvDetailModel.seasons ?? [];
    return Expanded(
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          final seasons = tvDetailModel.seasons ?? [Seasons()];
          final _lastSeason = seasons.last;
          if (_lastSeason.overview == '') {
            _lastSeason.overview = 'Season 1 of ' +
                (tvDetailModel.name ?? '') +
                ' premiered on ' +
                (covertDatetime() ?? '');
          }
          return Container(
            padding: EdgeInsets.all(20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Current Season', style: appCubit.styles.customTextStyle3()),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.grey)),
                width: 375,
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _lastSeason.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 24),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          _lastSeason.airDate?.substring(0, 4) ?? '',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Container(
                          color: Colors.black,
                          height: 15,
                          width: 1,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          _lastSeason.episodeCount.toString() + ' Episode',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      _lastSeason.overview ?? '',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
              TextButton(
                child: Text('View All Seasons',
                    style: appCubit.styles.customTextStyle3()),
                onPressed: () {},
              ),
            ]),
          );
        },
      ),
    );
  }
}
