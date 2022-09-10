import 'package:bloc/bloc.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

import '../../respositories/movie_detail_repositories.dart';

part 'movie_detail_state.dart';

class MovieDetailCubit extends Cubit<MovieDetailState> {
  MovieDetailCubit() : super(MovieDetailInitial());

  MovieDetailRepositories movieDetailRepositories = MovieDetailRepositories();

  void getMovieDetail(num? movieId) async {
    try {
      final response = await movieDetailRepositories.getMovieDetail(movieId!);
      if (response?.id == movieId) {
        emit(MovieDetailSuccess(response!));
      } else {
        emit((MovieDetailFail()));
      }
    } catch (e) {
      emit(MovieDetailFail());
    }
  }

  void getRecommendMovie(num? movieId) async {
    try {
      final response =
          await movieDetailRepositories.getRecommendation(movieId!);
      if (response != null) {
        emit(RecommendSuccess(response));
      } else {
        emit((RecommendFail()));
      }
    } catch (e) {
      emit(RecommendFail());
    }
  }

  void getKeywordsMovie(num? movieId) async {
    try {
      final response = await movieDetailRepositories.getKeywordsMovie(movieId!);

      if (response != null) {
        emit(KeywordsSuccess(response));
      } else {
        emit((KeywordsFail()));
      }
    } catch (e) {
      emit(KeywordsFail());
    }
  }

  void getTrailersMovie(num? movieId) async {
    try {
      final response = await movieDetailRepositories.getTrailersMovie(movieId!);
      if (response!.id == movieId) {
        emit(TrailersSuccess(response));
      } else {
        emit((TrailersFail()));
      }
    } catch (e) {
      emit(TrailersFail());
    }
  }
}
