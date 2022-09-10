part of 'tv_detail_cubit.dart';

abstract class TvDetailState extends Equatable {
  const TvDetailState();

  @override
  List<Object> get props => [];
}

class TvDetailInitial extends TvDetailState {}

class TvDetailLoading extends TvDetailState {}

class TvDetailSuccess extends TvDetailState {
  TvDetailModel tvDetailModel;
  TvDetailSuccess(this.tvDetailModel);
}

class RecommendTvSuccess extends TvDetailState {
  MoviesResultModel moviesResultModel;
  RecommendTvSuccess(this.moviesResultModel);
}

class KeywordsTvSuccess extends TvDetailState {
  KeywordsTV keywordsTV;
  KeywordsTvSuccess(this.keywordsTV);
}

class TrailersTvSuccess extends TvDetailState {
  Trailers trailers;
  TrailersTvSuccess(this.trailers);
}

class RecommendFail extends TvDetailState {}

class TvDetailFail extends TvDetailState {}

class KeywordsTvFail extends TvDetailState {}

class TrailersTvFail extends TvDetailState {}
