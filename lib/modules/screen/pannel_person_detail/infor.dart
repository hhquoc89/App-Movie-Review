import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../event/model/person_detail.dart';
import '../../person_detail/cubit/person_detail_cubit.dart';

class Info extends StatelessWidget {
  late PersonDetailCubit personDetailCubit;
  PersonDetailModel personDetailModel = PersonDetailModel();
  Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    personDetailCubit = PersonDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as num;
    personDetailCubit.getPersonDetail(args);
    return Container(
      color: Colors.yellow,
      alignment: Alignment.topLeft,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: BlocConsumer(
        bloc: personDetailCubit,
        listener: (context, state) {
          if (state is PersonDetailSuccess) {
            personDetailModel = state.personDetailModel;
          }
        },
        builder: (context, state) {
          final _gender = personDetailModel.gender ?? 0;
          String _genderText = '';

          bool isDeath = false;
          final _deathday = personDetailModel.deathday ?? '3000-01-02';
          final _birthday = personDetailModel.birthday ?? '3000-01-02';
          final now = DateTime.now().year;

          if (_deathday != '3000-01-02') {
            isDeath = true;
          } else {
            isDeath = false;
          }
          if (isDeath == true) {
            age(_deathday, _birthday);
          } else {
            age(_deathday, _birthday);
          }
          if (_gender == 1) {
            _genderText = 'Female';
          } else {
            _genderText = 'Male';
          }
          print(isDeath);
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Personal Info',
                style: TextStyle(fontSize: 20.8, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 120,
                children: [
                  SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Known For',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(personDetailModel.knownForDepartment ?? ' '),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Known Credits',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Gender',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(_genderText),
                      ],
                    ),
                  ),
                ],
              ),
              isDeath
                  ? Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Birthday',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (personDetailModel.birthday ?? '-'),
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Death Day',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (personDetailModel.deathday ?? '-') +
                                '(' +
                                ' years old )',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Birthday',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            (personDetailModel.birthday ?? '-') +
                                '(' +
                                ' years old )',
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
              SizedBox(
                height: 50,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Place of birth',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text((personDetailModel.placeOfBirth ?? '-'),
                        style: const TextStyle(
                          fontSize: 16,
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  String age(_deathday, _birthday) {
    final yearDeath = DateTime.parse(_deathday).year;
    final yearBorn = DateTime.parse(_birthday).year;
    return (yearDeath - yearBorn).toString();
  }
}
