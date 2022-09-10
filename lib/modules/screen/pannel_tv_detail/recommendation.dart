import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/tv_detail/cubit/tv_detail_cubit.dart';
import 'package:flutter_boilerplate/routers/route_name.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../respositories/movie_detail_repositories.dart';

class Recommendation extends StatelessWidget {
  late TvDetailCubit tvDetailCubit;
  TvDetailModel tvDetailModel = TvDetailModel();
  MoviesResultModel movieResultModel = MoviesResultModel();
  KeywordsTV keywordsTV = KeywordsTV();
  Recommendation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    tvDetailCubit = TvDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as Results;
    tvDetailCubit.getTvDetail(args.id);
    tvDetailCubit.getRecommendTv(args.id);
    tvDetailCubit.getKeywordsTv(args.id);
    final appCubit = context.read<AppCubit>();

    return Container(
      alignment: Alignment.topLeft,
      padding: const EdgeInsets.all(20),
      child: BlocConsumer(
        bloc: tvDetailCubit,
        listener: (context, state) {
          if (state is RecommendTvSuccess) {
            movieResultModel = state.moviesResultModel;
          }
          if (state is TvDetailSuccess) {
            tvDetailModel = state.tvDetailModel;
            bool _isSameName = false;
            if (tvDetailModel.name == tvDetailModel.originalName) {
              _isSameName = true;
            }
          }
          if (state is KeywordsTvSuccess) {
            keywordsTV = state.keywordsTV;
          }
        },
        builder: (context, state) {
          String url = 'https://image.tmdb.org/t/p/original/';
          final results = movieResultModel.results ?? [];
          final _originalName = tvDetailModel.originalName ?? '';
          String _originalLanguage = tvDetailModel.originalLanguage ?? '';
          final _status = tvDetailModel.status ?? '';
          final _type = tvDetailModel.type ?? '';
          final _network = tvDetailModel.networks ?? [];
          final _keywords = keywordsTV.results ?? [];
          bool _isSameName = false;
          if (tvDetailModel.name == tvDetailModel.originalName) {
            _isSameName = true;
          }
          switch (_originalLanguage) {
            case 'en':
              _originalLanguage = 'English';
              break;
            case 'ja':
              _originalLanguage = 'Japanese';
              break;
            default:
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Recommendation', style: appCubit.styles.customTextStyle3()),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                width: 500,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final result = results[index];
                      final _percent = (result.voteAverage ?? 0) / 10;
                      final _percentText = (_percent * 100).round().toString();
                      return Container(
                        width: 250,
                        height: 60,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, RouteName.tvDetail,
                                    arguments: result);
                              },
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                child: CachedNetworkImage(
                                  imageUrl: url +
                                      (result.backdropPath ??
                                          '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                                  width: double.infinity,
                                  height: 141,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: const EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      strutStyle: StrutStyle(
                                          fontWeight: FontWeight.bold),
                                      text: TextSpan(
                                          style: TextStyle(color: Colors.black),
                                          text: (result.name ?? '')),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(_percentText + '%'),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        width: 12,
                      );
                    },
                    itemCount: results.length),
              ),
              const SizedBox(height: 15),
              Container(
                  height: 60,
                  child: Row(
                    children: [
                      FaIcon(FontAwesomeIcons.facebookSquare),
                      const SizedBox(width: 15),
                      FaIcon(FontAwesomeIcons.twitterSquare),
                      const SizedBox(width: 15),
                      FaIcon(FontAwesomeIcons.instagram),
                      const SizedBox(width: 15),
                      Container(
                        height: 40,
                        width: 1,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 15),
                      FaIcon(FontAwesomeIcons.link),
                    ],
                  )),
              Text('Fact', style: appCubit.styles.defaultTextStyleBold()),
              _isSameName == false
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Original Name',
                            style: appCubit.styles.defaultTextStyleBold()),
                        Text(_originalName,
                            style: appCubit.styles.defaultTextStyle()),
                      ],
                    )
                  : Text(''),
              const SizedBox(height: 10),
              Text('Status', style: appCubit.styles.defaultTextStyleBold()),
              Text(_status, style: appCubit.styles.defaultTextStyle()),
              const SizedBox(height: 10),
              Text('Network', style: appCubit.styles.defaultTextStyleBold()),
              Wrap(
                children: _network.map((e) => network(e, context)).toList(),
                spacing: 8,
              ),
              const SizedBox(height: 10),
              Text('Type', style: appCubit.styles.defaultTextStyleBold()),
              Text(_type, style: appCubit.styles.defaultTextStyle()),
              const SizedBox(height: 10),
              Text('Original Language',
                  style: appCubit.styles.defaultTextStyleBold()),
              Text(_originalLanguage,
                  style: appCubit.styles.defaultTextStyle()),
              const SizedBox(height: 10),
              Text('Keyword', style: appCubit.styles.customTextStyle3()),
              Wrap(
                children: _keywords
                    .map((e) => keyword(e.name ?? '', context))
                    .toList(),
                spacing: 8,
              ),
            ],
          );
        },
      ),
    );
  }
}

Widget keyword(String data, BuildContext context) => ChoiceChip(
      labelPadding: EdgeInsets.all(1),
      label: Text(
        data,
        style: TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      selected: true,
      elevation: 1,
      padding: EdgeInsets.symmetric(horizontal: 10),
    );
Widget network(Networks network, BuildContext context) {
  String url = 'https://image.tmdb.org/t/p/w300/';
  return CachedNetworkImage(
    imageUrl: url + (network.logoPath ?? '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
    width: 50,
    height: 50,
    fit: BoxFit.fill,
  );
}
