import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';

import '../../../app/cubit/app_cubit.dart';
import '../../../routers/route_name.dart';

class Overview extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    final appCubit = context.read<AppCubit>();

    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          final _tagline = tvDetailModel.tagline ?? '';
          final _overview = tvDetailModel.overview ?? '';
          final _createBy = tvDetailModel.createdBy ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(_tagline,
                  style: const TextStyle(
                      fontSize: 16, fontStyle: FontStyle.italic)),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Overview',
                style: appCubit.styles.customTextStyle3(),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(_overview,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold))),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                children: _createBy
                    .map((e) => peopleCard(e.name ?? '', e.id ?? 0, context))
                    .toList(),
                spacing: 8,
              )
            ],
          );
        },
      ),
    );
  }
}

Widget peopleCard(String name, num id, BuildContext context) => Container(
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, RouteName.personDetail,
                  arguments: id);
            },
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Creator',
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
