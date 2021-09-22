import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'translation_service.dart';
import 'dart:convert' as convert;
import '../model/setting_response.dart';

class SettingsService extends GetxService {
  final setting = SettingResponse().obs;

  Future<SettingsService> init() async {
    Get.log('Start SettingsService');

    var value = await _getJsonFile('assets/setting/setting.json');
    setting.value = SettingResponse.fromJson(value);

    return this;
  }

  ThemeData getLightTheme() {
    return ThemeData(
        primaryColor: Colors.white,
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
            elevation: 0, foregroundColor: Colors.white),
        brightness: Brightness.light,
        accentColor: _parseColor(setting.value.mainColor),
        dividerColor: _parseColor(setting.value.accentColor, opacity: 0.1),
        focusColor: _parseColor(setting.value.accentColor),
        hintColor: _parseColor(setting.value.secondColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: _parseColor(setting.value.mainColor))),
        colorScheme: ColorScheme.light(
            primary: _parseColor(setting.value.mainColor),
            secondary: _parseColor(setting.value.mainColor)),
        textTheme: GoogleFonts.getTextTheme(
            getLocale().toString().startsWith('ar') ? 'Cairo' : 'Poppins',
            TextTheme(
                headline6: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.mainColor),
                    height: 1.3),
                headline5: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.3),
                headline4: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.3),
                headline3: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.3),
                headline2: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.mainColor),
                    height: 1.4),
                headline1: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.4),
                subtitle2: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.2),
                subtitle1: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.mainColor),
                    height: 1.2),
                bodyText2: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.2),
                bodyText1: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.secondColor),
                    height: 1.2),
                caption: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: _parseColor(setting.value.accentColor),
                    height: 1.2))));
  }

  ThemeData getDarkTheme() {
    return ThemeData(
        primaryColor: const Color(0xFF252525),
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(elevation: 0),
        scaffoldBackgroundColor: const Color(0xFF2C2C2C),
        brightness: Brightness.dark,
        accentColor: _parseColor(setting.value.mainDarkColor),
        dividerColor: _parseColor(setting.value.accentDarkColor, opacity: 0.1),
        focusColor: _parseColor(setting.value.accentDarkColor),
        hintColor: _parseColor(setting.value.secondDarkColor),
        toggleableActiveColor: _parseColor(setting.value.mainDarkColor),
        textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                primary: _parseColor(setting.value.mainColor))),
        colorScheme: ColorScheme.dark(
            primary: _parseColor(setting.value.mainDarkColor),
            secondary: _parseColor(setting.value.mainDarkColor)),
        textTheme: GoogleFonts.getTextTheme(
            getLocale().toString().startsWith('ar') ? 'Cairo' : 'Poppins',
            TextTheme(
                headline6: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.mainDarkColor),
                    height: 1.3),
                headline5: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.3),
                headline4: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.3),
                headline3: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.3),
                headline2: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700,
                    color: _parseColor(setting.value.mainDarkColor),
                    height: 1.4),
                headline1: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w300,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.4),
                subtitle2: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.2),
                subtitle1: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.mainDarkColor),
                    height: 1.2),
                bodyText2: TextStyle(
                    fontSize: 13.0,
                    fontWeight: FontWeight.w600,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.2),
                bodyText1: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                    color: _parseColor(setting.value.secondDarkColor),
                    height: 1.2),
                caption: TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w300,
                    color: _parseColor(setting.value.accentDarkColor),
                    height: 1.2))));
  }

  Locale getLocale() {
    String? _locale = GetStorage().read<String>('language');
    if (_locale == null || _locale.isEmpty) {
      _locale = setting.value.mobileLanguage;
    }

    return Get.find<TranslationService>().fromStringToLocale(_locale!);
  }

  ThemeMode getThemeMode() {
    String? _themeMode = GetStorage().read<String>('theme_mode');
    switch (_themeMode) {
      case 'ThemeMode.light':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.light
              .copyWith(systemNavigationBarColor: Colors.white),
        );
        return ThemeMode.light;
      case 'ThemeMode.dark':
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle.dark
              .copyWith(systemNavigationBarColor: Colors.black87),
        );
        return ThemeMode.dark;
      case 'ThemeMode.system':
        return ThemeMode.system;
      default:
        if (setting.value.defaultTheme == 'dark') {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.dark
                .copyWith(systemNavigationBarColor: Colors.black87),
          );
          return ThemeMode.dark;
        } else {
          SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle.light
                .copyWith(systemNavigationBarColor: Colors.white),
          );
          return ThemeMode.light;
        }
    }
  }

  _parseColor(String? hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode!.replaceAll('#', '0xFF')))
          .withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  Future<dynamic> _getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
}
