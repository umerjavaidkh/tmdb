import 'package:flutter/material.dart';
import 'package:tmdb/common/constants/route_constants.dart';

import 'pages/home/home_screen.dart';
import 'pages/movie_detail/movie_detail_arguments.dart';
import 'pages/movie_detail/movie_detail_screen.dart';


class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => HomeScreen(),
        RouteList.movieDetail: (context) => MovieDetailScreen(
              movieDetailArguments: setting.arguments as MovieDetailArguments,
            ),
      };
}
