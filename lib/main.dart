import 'dart:async';

import 'package:tmdb_movie_app/inits/app_observer.dart';
import 'package:bloc/bloc.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'app/app.dart';
import 'common/singletons/dio_singleton.dart';
import 'common/storage/cache_service.dart';
import 'inits/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync<CacheService>(() => CacheService().init());
  await init();
  runApp( App());
}

Future<void> init() async {
  configureDependencies();
  await DioService().initializeDio();
  Bloc.observer = AppBlocObserver();
}

