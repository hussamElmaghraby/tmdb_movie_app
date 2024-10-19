import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import '../interceptors/dio_interceptor.dart';
import '../urls_constants/apis_constants.dart';

@singleton
class DioService {
  late Dio _dio;
  static final DioService _singleton = DioService._internal();

  factory DioService() {
    return _singleton;
  }

  DioService._internal() {
    initializeDio();
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  Future<void> initializeDio() async {
    final token = await getToken();
    _dio = Dio(
      BaseOptions(
        baseUrl: Apis.baseUrl,
        connectTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 3000),
        followRedirects: false,
        maxRedirects: 100,
        headers: {
          if (token != null) 'Authorization': 'Bearer $token',
        },
      ),
    );

    _dio.interceptors.addAll([
      DioInterceptor(),
      PrettyDioLogger(),
    ]);
  }

  Future<Response> get(String url, {Map<String, dynamic>? params}) async {
    return _dio.get(url, queryParameters: params , );
  }

  Future<Response> post(String url,
      {Map<String, dynamic>? data, Options? options , }) async {

    return _dio.post(
      url,

      data: data,
      options: options,
    );
  }
}
