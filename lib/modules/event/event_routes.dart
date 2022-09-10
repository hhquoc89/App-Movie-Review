import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate/modules/enviroment_screen.dart';

import 'package:flutter_boilerplate/modules/respositories/search_repositories.dart';
import 'package:flutter_boilerplate/modules/screen/login_screen.dart';
import 'package:flutter_boilerplate/modules/screen/main_screen.dart';
import 'package:flutter_boilerplate/modules/screen/movie_detail_screen.dart';
import 'package:flutter_boilerplate/modules/screen/person_detail_screen.dart';
import 'package:flutter_boilerplate/modules/screen/search_screen.dart';
import 'package:flutter_boilerplate/modules/screen/sign_up_screen.dart';
import 'package:flutter_boilerplate/modules/screen/tv_detail_screen.dart';

import '../../routers/route_name.dart';
import '../../routers/routes.dart';

import '../structure_testing_screen/structure_testing_screen.dart';

class EventRoutes implements RouteInterface {
  @override
  CupertinoPageRoute routePage(RouteSettings settings) {
    return CupertinoPageRoute(
        settings: settings,
        builder: (context) {
          switch (settings.name) {
            case RouteName.personDetail:
              final arg = settings.arguments as num;
              return PersonDetailScreen(
                personId: arg,
              );
            case RouteName.tvDetail:
              final arg = settings.arguments as Results;
              return TVDetailScreen(movieId: arg.id);
            case RouteName.movieDetail:
              final arg = settings.arguments as Results;
              return MovieDetailScreen(movieId: arg.id);
            case RouteName.event:
              return const EnvironmentScreen();
            case RouteName.eventDetails:
              return const StructureTestingScreen();
            case RouteName.search:
              return const SearchScreen();
            case RouteName.login:
              return LoginScreen();
            case RouteName.main:
              return MainScreen();
            case RouteName.signUp:
              return const SignUpScreen();
            default:
              return Container();
          }
        });
  }
}
