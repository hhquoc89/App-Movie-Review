import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class SecondHeader extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();

  SecondHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);

    return Container(
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
          }
        },
        builder: (context, state) {
          final _percent = (tvDetailModel.voteAverage ?? 0) / 10;
          final _percentText = (_percent * 100).round();
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 60,
                child: Row(
                  children: [
                    CircularPercentIndicator(
                      radius: 30.0,
                      lineWidth: 5.0,
                      percent: _percent,
                      center: Text(_percentText.toString() + '%',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                      progressColor: Colors.green,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'User Score',
                      style: (TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ),
              Container(
                height: 40,
                width: 1,
                color: Colors.black,
              ),
              Container(
                height: 60,
                child: InkWell(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.play_arrow),
                      Text(
                        'Play trailer',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
