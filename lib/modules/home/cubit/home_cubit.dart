import 'package:bloc/bloc.dart';

import 'package:flutter_boilerplate/modules/respositories/home_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/respositories/trending_repositories.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  PopularRepositories popularRepositories = PopularRepositories();
  TrendingRepositories trendingRepositories = TrendingRepositories();
  void showPopularTV() async {
    try {
      final response = await popularRepositories.getPopularMoviesTV(1);
      if (response?.results != null) {
        emit(HomeSuccess(response?.results ?? []));
      } else {
        emit(HomeSuccess(const []));
      }

      // }
    } catch (e) {
      emit(HomeSuccess([]));
    }
  }

  void showPopularTheater() async {
    try {
      final response = await popularRepositories.getPopularMoviesTheater(1);
      if (response?.results != null) {
        emit(HomeSuccess(response?.results ?? []));
      } else {
        emit(HomeSuccess(const []));
      }
    } catch (e) {
      emit(HomeSuccess([]));
    }
  }

  void showTrendingDay() async {
    try {
      final response = await trendingRepositories.getTrendingDay();
      if (response?.results != null) {
        emit(HomeSuccess(response?.results ?? []));
      } else {
        emit(HomeSuccess(const []));
      }
      print(response!.totalResults);
    } catch (e) {
      emit(HomeSuccess([]));
    }
  }

  void showTrendingWeek() async {
    try {
      final response = await trendingRepositories.getTrendingWeek();
      if (response?.results != null) {
        emit(HomeSuccess(response?.results ?? []));
      } else {
        emit(HomeSuccess(const []));
      }
      print(response!.totalResults);
    } catch (e) {
      emit(HomeSuccess([]));
    }
  }
}
