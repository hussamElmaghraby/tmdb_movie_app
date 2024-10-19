import 'package:tmdb_movie_app/common/urls_constants/apis_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interceptors/dio_interceptor.dart';

@module
abstract class RegisterModule {
  // You can register named preemptive types like follows
  @Named("BaseUrl")
  String get baseUrl => Apis.baseUrl;

  // url here will be injected
  @lazySingleton
  Dio dio(@Named('BaseUrl') String url) =>
      Dio(
        BaseOptions(
          baseUrl: url,
          headers: {
            "Content-Type": "application/json",
          },
        ),
      )
        ..interceptors.addAll([
          DioInterceptor(),
          PrettyDioLogger(),
        ]);


  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
