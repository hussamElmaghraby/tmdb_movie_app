
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tmdb_movie_app/features/movies/presentation/screens/home_screen.dart';
import 'package:tmdb_movie_app/features/movies/presentation/screens/movie_details_screen.dart';
import 'package:tmdb_movie_app/features/movies/presentation/screens/movies_screen.dart';

import 'index.dart';

class AppPages {
  AppPages._();

  static  final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const Scaffold(body: SizedBox()),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
    ),

    GetPage(
      name: AppRoutes.MOVIES,
      page: () => const MoviesScreen(),
    ),
    GetPage(
      name: AppRoutes.MOVIE_DETAILS,
      page: () => const MovieDetailsScreen(),
    ),
  ];
}
