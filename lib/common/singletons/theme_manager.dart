
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../storage/cache_service.dart';
import '../storage/storage_keys.dart';

class ThemeManager {
  static final ThemeManager _singleton = ThemeManager._internal();
  final CacheService _cacheService = Get.find();

  ThemeManager._internal();

 factory ThemeManager(){
    return ThemeManager._internal();
  }


  ThemeMode get  getTheme{
      final bool isDark = _cacheService.getBool(StorageKeys.isDarkMode) ?? false;
      return isDark ? ThemeMode.dark : ThemeMode.light;
  }
}
