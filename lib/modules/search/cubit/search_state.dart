part of 'search_cubit.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchSuccess extends SearchState {
  List<Results> listResults;
  SearchSuccess(this.listResults);
}

class SearchFail extends SearchState {}
