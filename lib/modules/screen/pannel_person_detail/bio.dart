import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/event/model/person_detail.dart';
import 'package:flutter_boilerplate/modules/person_detail/cubit/person_detail_cubit.dart';

class Bio extends StatelessWidget {
  late PersonDetailCubit personDetailCubit;
  PersonDetailModel personDetailModel = PersonDetailModel();
  Bio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    personDetailCubit = PersonDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as num;
    personDetailCubit.getPersonDetail(args);
    return Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: BlocConsumer(
          bloc: personDetailCubit,
          listener: (context, state) {
            if (state is PersonDetailSuccess) {
              personDetailModel = state.personDetailModel;
            }
          },
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Biography',
                  style: TextStyle(fontSize: 20.8, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  personDetailModel.biography ?? '',
                  style: TextStyle(fontSize: 16),
                  maxLines: 10,
                ),
              ],
            );
          },
        ));
  }
}
