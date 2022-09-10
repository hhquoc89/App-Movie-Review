part of 'movie_detail_cubit.dart';

abstract class MovieDetailState {
  const MovieDetailState();
}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailLoading extends MovieDetailState {}

class MovieDetailSuccess extends MovieDetailState {
  MovieDetailModel movieDetailModel;
  MovieDetailSuccess(this.movieDetailModel);
}

class RecommendSuccess extends MovieDetailState {
  MoviesResultModel moviesResultModel;
  RecommendSuccess(this.moviesResultModel);
}

class KeywordsSuccess extends MovieDetailState {
  KeywordsModel keywordsModel;
  KeywordsSuccess(this.keywordsModel);
}

class TrailersSuccess extends MovieDetailState {
  Trailers trailers;
  TrailersSuccess(this.trailers);
}

class RecommendFail extends MovieDetailState {}

class MovieDetailFail extends MovieDetailState {}

class KeywordsFail extends MovieDetailState {}

class TrailersFail extends MovieDetailState {}
