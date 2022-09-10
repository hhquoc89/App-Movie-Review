import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';

import '../../../app/cubit/app_cubit.dart';

class Overview extends StatelessWidget {
  late MovieDetailCubit movieDetailCubit;
  MovieDetailModel movieDetailModel = MovieDetailModel();
  Overview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    movieDetailCubit = MovieDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    movieDetailCubit.getMovieDetail(args.id);
    final appCubit = context.read<AppCubit>();

    return Container(
      width: 200,
      padding: const EdgeInsets.all(20),
      alignment: Alignment.topLeft,
      child: BlocConsumer(
        bloc: movieDetailCubit,
        listener: (context, state) {
          if (state is MovieDetailSuccess) {
            movieDetailModel = state.movieDetailModel;
          }
        },
        builder: (context, state) {
          final _tagline = movieDetailModel.tagline ?? '';
          final _overview = movieDetailModel.overview ?? '';
          List<Crew> _crews = movieDetailModel.credits?.crew ?? [];
          List<Crew> _newCrews = [];
          for (int index = 0; index < _crews.length; index++) {
            final crew = _crews[index];
            if (crew.knownForDepartment == 'Directing' &&
                crew.department == 'Directing' &&
                crew.job == 'Director') {
              {
                _newCrews.add(crew);
              }
            }
            if (crew.knownForDepartment == 'Writing' &&
                crew.department == 'Writing' &&
                crew.job == 'Characters') {
              {
                _newCrews.add(crew);
              }
            }
            if (crew.knownForDepartment == 'Writing' &&
                crew.department == 'Writing' &&
                crew.job == 'Story') {
              {
                _newCrews.add(crew);
              }
            }
            if (crew.knownForDepartment == 'Writing' &&
                crew.department == 'Writing' &&
                crew.job == 'Screenplay') {
              {
                _newCrews.add(crew);
              }
            }
          }
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
                children: _newCrews
                    .map((e) => peopleCard(
                        e.name ?? '', e.job ?? '', e.id ?? 0, context))
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

Widget peopleCard(String name, String job, num id, BuildContext context) =>
    Container(
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
            height: 8,
          ),
          Text(
            job,
            style: TextStyle(fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
