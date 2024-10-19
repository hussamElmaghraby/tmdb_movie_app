import 'dart:convert';

import 'package:tmdb_movie_app/common/storage/cache_service.dart';
import 'package:tmdb_movie_app/common/storage/storage_keys.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../common/routes/names.dart';
import '../common/routes/pages.dart';
import '../common/singletons/theme_manager.dart';
import '../common/theme/themes.dart';
import '../common/translation/translation_service.dart';

class App extends StatelessWidget {
  App({super.key});

  final CacheService _cacheService = CacheService.to;

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      disableBackButton: false,
      overlayWidgetBuilder: (_) => LoadingAnimationWidget.staggeredDotsWave(
        color: Colors.white,
        size: 200,
      ),
      child: ScreenUtilInit(
        child:
            GetMaterialApp(
          // color: Get.theme.colorScheme.background,
          translations: TranslationService(),
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: ThemeManager().getTheme,
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          locale: TranslationService.arabicLocale,
          fallbackLocale: TranslationService.fallbackLocale,
        ),
        // ),
      ),
    );
  }

}
