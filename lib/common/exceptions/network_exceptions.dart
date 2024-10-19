import 'package:tmdb_movie_app/common/storage/cache_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/names.dart';
import '../translation/trans_labels.dart';
import '../widgets/popup/app_hint_dialog.dart';

class NetworkException implements Exception {
  final String message;

  NetworkException(this.message);
}

class UnauthorizedException implements Exception {
  final String message;

  UnauthorizedException(this.message);
}

class ApiExceptionHandler {
  static handleException(BuildContext context, {required Object? error}) async{
    final CacheService _cacheService = CacheService.to;

    switch (error) {
      case DioException():
        final int statusCode = error.response?.statusCode ?? -1;
        switch (statusCode) {
          case 403:

          case 500:
            showDialog(
                context: context,
                builder: (_) => AppHintDialog(
                      title: error.response?.statusMessage,
                      message: error.message,
                    ));

          case 400:
           if( error.requestOptions.path  !=  '/api/v1/verify-user-mobile/'){
             await  _cacheService.clear();
             Get.toNamed(AppRoutes.INITIAL);
           }else {
             showDialog(
                 context: context,
                 builder: (_) => AppHintDialog(
                   title: error.response?.statusMessage,
                   message: error.response?.data['error']?[0] ??
                       unknownErrorLabel.tr,
                 ));
           }
          case 401:
         await  _cacheService.clear();
         Get.toNamed(AppRoutes.INITIAL);

            // if (error.response?.data['error'] != null) {
            //   showDialog(
            //       context: context,
            //       builder: (_) => AppHintDialog(
            //             title: error.response?.statusMessage,
            //             message: error.response?.data['error']?[0] ??
            //                 unknownErrorLabel.tr,
            //           ));
            // } else if (error.response?.data['message'] != null) {
            //   showDialog(
            //       context: context,
            //       builder: (_) => AppHintDialog(
            //             title: error.response?.statusMessage,
            //             message: error.response?.data['message'] ??
            //                 unknownErrorLabel.tr,
            //           ));
            // }

          case 429:
            showDialog(
                context: context,
                builder: (_) => AppHintDialog(
                      title: error.response?.statusMessage,
                      message: error.response?.data['message'] ??
                          unknownErrorLabel.tr,
                    ));
          default:
            if(error.response == null ){
              showDialog(
                  context: context,
                  builder: (_) => AppHintDialog(
                    title: unknownErrorLabel.tr,
                    message: error.response?.data['error']?[0] ??
                        connectionErrorLabel.tr,
                  ));
            }else {
              showDialog(
                  context: context,
                  builder: (_) => AppHintDialog(
                    title: error.response?.statusMessage,
                    message: error.response?.data['error']?[0] ??
                        unknownErrorLabel.tr,
                  ));
            }

        }
    }
  }
}
