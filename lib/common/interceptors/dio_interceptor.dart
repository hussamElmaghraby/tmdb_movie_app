import 'dart:async';

import 'package:dio/dio.dart';

import '../../../common/urls_constants/apis_constants.dart';
import '../singletons/dio_singleton.dart';
import '../storage/cache_service.dart';
import '../storage/storage_keys.dart';

class DioInterceptor extends Interceptor {
  late DateTime _timeoutAt;
  Dio dio = Dio(BaseOptions(
    followRedirects: false,
    baseUrl: Apis.baseUrl,
  ));

  final CacheService _cacheService = CacheService.to;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken =
        _cacheService.getString(StorageKeys.access_token);
    options.headers.addAll({
      "Content-Type": "application/json",
      "Accept": "*/*",
      "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyNmM0YmRiMDgyZGNkOGM3NTEwNmFjNzJjNDc2ZDQ4ZSIsIm5iZiI6MTcyOTM0ODExMi44MTI2NDYsInN1YiI6IjY1NjlhMWEyNjM1MzZhMDBjNDJhOGNkYyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.YKyznpS-ARloCyiyxnWXxZt0iJUh3Tlu6qIvX2fr4Xs"
    });

    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    handler.next(err);
  }

  Future<Response<dynamic>> refreshToken() async {
    final String accessToken =
        _cacheService.getString(StorageKeys.access_token);
    var response = await DioService().post(
      Apis.baseUrl,
    );

    if (response.statusCode == 200) {
      _cacheService.setString(StorageKeys.access_token,
          "${response.data['token_type']} ${response.data['access_token']}");
    }
    return response;
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: {},
    );

    return dio.request<dynamic>(requestOptions.path,
        data: requestOptions.data,
        queryParameters: requestOptions.queryParameters,
        options: options);
  }

  refreshTimer(int expiryTime) {
    _timeoutAt = DateTime.now().add(Duration(seconds: expiryTime - 120));
    Timer.periodic(
      const Duration(seconds: 60),
      (timer) {
        final isTimeout = DateTime.now().isAfter(_timeoutAt);
        if (isTimeout) {
          //Call back from here
          refreshToken();
          // timer.cancel();
        }
      },
    );
  }
}
