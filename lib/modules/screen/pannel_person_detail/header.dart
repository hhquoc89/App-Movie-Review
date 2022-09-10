import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/modules/event/model/person_detail.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../person_detail/cubit/person_detail_cubit.dart';

class Header extends StatelessWidget {
  late PersonDetailCubit personDetailCubit;
  PersonDetailModel personDetailModel = PersonDetailModel();
  Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    personDetailCubit = PersonDetailCubit();
    final args = ModalRoute.of(context)!.settings.arguments as num;
    personDetailCubit.getPersonDetail(args);
    return Container(
        width: double.infinity,
        child: BlocConsumer(
          bloc: personDetailCubit,
          listener: (context, state) {
            if (state is PersonDetailSuccess) {
              personDetailModel = state.personDetailModel;
            }
          },
          builder: (context, state) {
            String url = 'https://image.tmdb.org/t/p/original';
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CachedNetworkImage(
                  imageBuilder: (context, imageProvider) => Container(
                    width: 156.0,
                    height: 156.0,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  imageUrl: url +
                      (personDetailModel.profilePath ??
                          '/wwemzKWzjKYJFfCeiB57q3r4Bcm.png'),
                  placeholder: (context, url) =>
                      Center(child: const CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  personDetailModel.name ?? '',
                  style: TextStyle(fontSize: 35.2, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FaIcon(
                      FontAwesomeIcons.twitterSquare,
                      size: 32,
                    ),
                    const SizedBox(width: 15),
                    FaIcon(FontAwesomeIcons.instagram, size: 32),
                    const SizedBox(width: 15),
                  ],
                )
              ],
            );
          },
        ));
  }
}
