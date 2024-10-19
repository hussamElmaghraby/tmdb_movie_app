import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'en_US.dart';
import 'ar_SA.dart';

class TranslationService extends Translations {






  static Locale? get locale => const Locale('ar', 'SA');
  static Locale? get arabicLocale => const Locale('ar', 'SA');
  static Locale? get englishLocale => const Locale('en', 'US');
  static const fallbackLocale = Locale('ar', 'SA');
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'ar_SA': ar_SA,
      };
}
