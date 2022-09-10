import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/modules/respositories/movie_detail_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/tv_detail_repositories.dart';

part 'tv_detail_state.dart';

class TvDetailCubit extends Cubit<TvDetailState> {
  TvDetailCubit() : super(TvDetailInitial());
  TvDetailRepositories tvDetailRepositories = TvDetailRepositories();

  void getTvDetail(num? tvId) async {
    try {
      final response = await tvDetailRepositories.getTVDetail(tvId!);
      if (response?.id == tvId) {
        emit(TvDetailSuccess(response!));
      } else {
        emit((TvDetailFail()));
      }
    } catch (e) {
      emit(TvDetailFail());
    }
  }

  void getRecommendTv(num? tvId) async {
    try {
      final response = await tvDetailRepositories.getRecommendationTv(tvId!);
      if (response != null) {
        emit(RecommendTvSuccess(response));
      } else {
        emit((RecommendFail()));
      }
    } catch (e) {
      emit(RecommendFail());
    }
  }

  void getKeywordsTv(num? tvId) async {
    try {
      final response = await tvDetailRepositories.getKeywordsTv(tvId!);
      if (response != null) {
        emit(KeywordsTvSuccess(response));
      } else {
        emit((KeywordsTvFail()));
      }
    } catch (e) {
      emit(KeywordsTvFail());
    }
  }

  void getTrailersTv(num? movieId) async {
    try {
      final response = await tvDetailRepositories.getTrailersTv(movieId!);
      if (response!.id == movieId) {
        emit(TrailersTvSuccess(response));
      } else {
        emit((TrailersTvFail()));
      }
    } catch (e) {
      emit(TrailersTvFail());
    }
  }
}
