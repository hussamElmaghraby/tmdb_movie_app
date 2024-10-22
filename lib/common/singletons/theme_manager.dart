import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb_movie_app/common/theme/themes.dart';
import '../storage/cache_service.dart';
import '../storage/storage_keys.dart';

class ThemeManager {
  static final ThemeManager _singleton = ThemeManager._internal();
  final CacheService _cacheService = Get.find();

  ThemeManager._internal();

  factory ThemeManager() {
    return ThemeManager._internal();
  }

  ThemeMode get getTheme {
    final bool isDark = _cacheService.getBool(StorageKeys.isDarkMode) ?? false;
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

   bool get isDark {
    bool? isDark = _cacheService.getBool(StorageKeys.isDarkMode);
    return isDark ?? false;
  }

  void changeTheme() {
    ThemeMode currentTheme = ThemeManager().getTheme;
    if (currentTheme == ThemeMode.light) {
      Get.changeThemeMode(ThemeMode.dark);
      _cacheService.setBool(StorageKeys.isDarkMode, true);
    } else {
      Get.changeThemeMode(ThemeMode.light);
      _cacheService.setBool(StorageKeys.isDarkMode, false);
    }
  }
}
