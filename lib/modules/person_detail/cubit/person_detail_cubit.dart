import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_boilerplate/modules/respositories/person_detail_respositories.dart';

import '../../event/model/person_detail.dart';

part 'person_detail_state.dart';

class PersonDetailCubit extends Cubit<PersonDetailState> {
  PersonDetailCubit() : super(PersonDetailInitial());

  PersonDetailRepositories personDetailRepositories =
      PersonDetailRepositories();

  void getPersonDetail(num? personId) async {
    try {
      final response =
          await personDetailRepositories.getPersonDetail(personId!);
      if (response?.id == personId) {
        emit(PersonDetailSuccess(response!));
      } else {
        emit((PersonDetailFail()));
      }
    } catch (e) {
      emit(PersonDetailFail());
    }
  }
}
