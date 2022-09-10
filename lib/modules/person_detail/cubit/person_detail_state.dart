part of 'person_detail_cubit.dart';

abstract class PersonDetailState {
  const PersonDetailState();
}

class PersonDetailInitial extends PersonDetailState {}

class PersonDetailSuccess extends PersonDetailState {
  PersonDetailModel personDetailModel;
  PersonDetailSuccess(this.personDetailModel);
}

class PersonDetailFail extends PersonDetailState {}
