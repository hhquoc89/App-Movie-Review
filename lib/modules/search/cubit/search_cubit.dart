import 'package:bloc/bloc.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepositories searchRepositories = SearchRepositories();

  SearchCubit() : super(SearchInitial());

  void searchMovie(String query, num page) async {
    try {
      final response = await searchRepositories.getListMovie(query, page);
      if (response?.results != null) {
        emit(SearchSuccess(response?.results ?? []));
      } else {
        emit(SearchSuccess(const []));
      }
      print(response!.totalResults);
      final dump = response.results;
      dump!.forEach((element) {
        print(element.mediaType);
      });

      // if (response != null) {
      //   print(response.totalResults);
      //   if (response.totalResults != 0) {
      //     print('data');
      //     emit(SearchSuccess(response.results ?? []));
      //   } else {
      //     print('data1');
      //     emit(SearchSuccess(response.results ?? []));
      //   }
      // } else {
      //   print('data2');
      //   emit(SearchSuccess([]));
      // }
    } catch (e) {
      emit(SearchSuccess([]));
    }
  }
}
