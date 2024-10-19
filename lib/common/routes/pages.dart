
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'index.dart';

class AppPages {
  AppPages._();

  static  final List<GetPage> routes = [

    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const Scaffold(body: SizedBox()),
    ),
  ];
}
