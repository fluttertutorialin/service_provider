import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'dart:convert' as convert;

class TranslationService extends GetxService {
  final translations = <String, Map<String, String>>{}.obs;

  final fallbackLocale = const Locale('en', 'US');

  static final languages = [
    'en_US',
    'es',
    'ar',
  ];

  Future<TranslationService> init() async {
    Get.log('Start TranslationService');

    languages.forEach((lang) async {
      var _file = await _getJsonFile('assets/locale/$lang.json');
      translations.putIfAbsent(lang, () => Map<String, String>.from(_file));
    });

    return this;
  }

  // get list of supported local in the application
  List<Locale> supportedLocales() {
    return TranslationService.languages.map((_locale) {
      return fromStringToLocale(_locale);
    }).toList();
  }

  // Convert string code to local object
  Locale fromStringToLocale(String _locale) {
    if (_locale.contains('_')) {
      // en_US
      return Locale(_locale.split('_').elementAt(0), _locale.split('_').elementAt(1));
    } else {
      // en
      return Locale(_locale);
    }
  }

  Future<dynamic> _getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}
