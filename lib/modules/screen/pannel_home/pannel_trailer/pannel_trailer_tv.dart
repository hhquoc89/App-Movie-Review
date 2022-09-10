import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/commons/utils/app_colors.dart';
import 'package:flutter_boilerplate/modules/home/cubit/home_cubit.dart';
import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import '../../../../app/cubit/app_cubit.dart';

class PannelTrailerTV extends StatelessWidget {
  // required variable
  late HomeCubit homeCubit;
  List<Results> listResults = [];

  PannelTrailerTV({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final appCubit = context.read<AppCubit>();
    homeCubit = HomeCubit();
    homeCubit.showPopularTV();
    return Container();
    // return Container(
    //   padding: const EdgeInsets.all(12),
    //   color: AppColors.darkBlue,
    //   child: Row(
    //     children: [
    //       Text(
    //         '',
    //         style: appCubit.styles.customTitlePanelDark(),
    //       ),
    //       const SizedBox(
    //         width: 20,
    //       ),
    //       Container(
    //         padding: EdgeInsets.all(8),
    //         height: 31,
    //         width: 110,
    //         decoration: BoxDecoration(
    //             color: AppColors.mintJelly,
    //             borderRadius: BorderRadius.circular(20)),
    //         child: DropdownButtonFormField<String>(
    //           alignment: Alignment.topLeft,
    //           decoration: InputDecoration.collapsed(
    //               hintText: listOption.first,
    //               hintStyle: appCubit.styles.customOptionDark()),
    //           dropdownColor: AppColors.mintJelly,
    //           items: listOption.map((String value) {
    //             return DropdownMenuItem<String>(
    //               value: value,
    //               child: Text(
    //                 value,
    //                 style: appCubit.styles.customOptionDark(),
    //               ),
    //             );
    //           }).toList(),
    //           onChanged: (String? value) {},
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
