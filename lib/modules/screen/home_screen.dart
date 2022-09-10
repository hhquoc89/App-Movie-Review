import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_boilerplate/app/cubit/app_cubit.dart';
import 'package:flutter_boilerplate/app/cubit/app_state.dart';
import 'package:flutter_boilerplate/commons/utils/app_colors.dart';
import 'package:flutter_boilerplate/modules/home/cubit/home_cubit.dart';
import 'package:flutter_boilerplate/modules/movie_detail/cubit/movie_detail_cubit.dart';

import 'package:flutter_boilerplate/modules/screen/pannel_home/panel_banner.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/panel_community.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_footer.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_leaderboard.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_popular/pannel_poppular_theater.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_popular/pannel_poppular_tv.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_trailer/pannel_trailer_theater.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_trending/pannel_trending_day.dart';
import 'package:flutter_boilerplate/modules/screen/pannel_home/pannel_trending/pannel_trending_week.dart';

import 'package:flutter_boilerplate/routers/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late AppCubit appCubit;
  late HomeCubit homeCubit;
  late MovieDetailCubit movieDetailCubit;
  late bool isTV;
  late bool isTrendingDay;

  @override
  void initState() {
    appCubit = context.read<AppCubit>();
    homeCubit = HomeCubit();
    isTrendingDay = true;
    isTV = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> listOptionPop = ['On TV', 'In Theater'];
    final List<String> listOptionTrending = ['Day', 'This Week'];
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is GetTokenFail) {
          print('API error');
        }
      },
      builder: (context, state) {
        return ListView(
          children: [
            PannelBanner(
              sourceImage: 'assets/images/banner.jpg',
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'What\'s Popular',
                    style: appCubit.styles.customTextStyle3(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 31,
                    width: 110,
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.topLeft,
                      decoration: InputDecoration.collapsed(
                          hintText: listOptionPop.first,
                          hintStyle: appCubit.styles.customOption()),
                      dropdownColor: AppColors.darkBlue,
                      items: listOptionPop.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: appCubit.styles.customOption(),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        switch (value) {
                          case 'On TV':
                            setState(() {
                              isTV = true;
                            });
                            break;
                          case 'In Theater':
                            setState(() {
                              isTV = false;
                            });
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isTV ? PannelPopularTV() : PannelPopularMovie(),
            PannelDark(
              text: 'Last Trailers',
              listOption: const ['On TV', 'In Theater'],
            ),
            Container(
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Text(
                    'Trending',
                    style: appCubit.styles.customTextStyle3(),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 31,
                    width: 110,
                    decoration: BoxDecoration(
                        color: AppColors.darkBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: DropdownButtonFormField<String>(
                      alignment: Alignment.topLeft,
                      decoration: InputDecoration.collapsed(
                          hintText: listOptionTrending.first,
                          hintStyle: appCubit.styles.customOption()),
                      dropdownColor: AppColors.darkBlue,
                      items: listOptionTrending.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: appCubit.styles.customOption(),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        switch (value) {
                          case 'Day':
                            setState(() {
                              isTrendingDay = true;
                            });
                            break;
                          case 'This Week':
                            setState(() {
                              isTrendingDay = false;
                            });
                            break;
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            isTrendingDay ? PannelTrendingDay() : PannelTrendingWeek(),
            PannelCommunity(
              sourceImage: 'assets/images/banner1.jpg',
            ),
            const PannelLeaderBoard(),
            const PannelFooter(),
            // ElevatedButton(
            //     child: Text(
            //       'Event Details',
            //       style: appCubit.styles.defaultTextStyle(),
            //     ),
            //     onPressed: () =>
            //         {Navigator.pushNamed(context, RouteName.eventDetails)})
          ],
        );
      },
    );
  }
}
