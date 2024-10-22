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
import 'package:tmdb_movie_app/features/movies/presentation/screens/home_screen.dart';
import 'package:tmdb_movie_app/features/movies/presentation/screens/movies_screen.dart';
import 'package:tmdb_movie_app/features/movies/presentation/state_managment/movies_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => MoviesBloc(),
          child: MoviesScreen(),
        ),
        BlocProvider(
          create: (_) => MoviesBloc(),
          child: HomeScreen(),
        ),
      ],
      child: GlobalLoaderOverlay(
        disableBackButton: false,
        overlayWidgetBuilder: (_) => LoadingAnimationWidget.staggeredDotsWave(
          color: Colors.white,
          size: 200,
        ),
        child: ScreenUtilInit(
          child: GetMaterialApp(
            // color: Get.theme.colorScheme.background,
            translations: TranslationService(),
            darkTheme: darkTheme,
            initialRoute: AppRoutes.HOME,
            theme: lightTheme,
            themeMode: ThemeManager().getTheme,
            debugShowCheckedModeBanner: false,
            getPages: AppPages.routes,
            locale: TranslationService.englishLocale,
            fallbackLocale: TranslationService.fallbackLocale,
          ),
          // ),
        ),
      ),
    );
  }
}
