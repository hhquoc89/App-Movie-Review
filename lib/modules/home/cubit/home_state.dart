part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  List<Results> listResults;
  HomeSuccess(this.listResults);
}

class HomeFail extends HomeState {}
