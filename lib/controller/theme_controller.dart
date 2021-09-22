import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeModeController extends GetxController {
  var selectedThemeMode = ThemeMode.light.obs;
  late GetStorage _box;

  ThemeModeController() {
    _box = GetStorage();
  }

  @override
  void onInit() {
    initThemeMode();
    super.onInit();
  }

  void initThemeMode() {
    String? _themeMode = _box.read<String>('theme_mode');

    switch (_themeMode) {
      case 'ThemeMode.light':
        selectedThemeMode.value = ThemeMode.light;
        break;
      case 'ThemeMode.dark':
        selectedThemeMode.value = ThemeMode.dark;
        break;
      case 'ThemeMode.system':
        selectedThemeMode.value = ThemeMode.system;
        break;
      default:
        selectedThemeMode.value = ThemeMode.system;
    }
  }

  void changeThemeMode(ThemeMode? themeMode) {
    Get.changeThemeMode(themeMode!);

    selectedThemeMode.value = themeMode;

    if (themeMode == ThemeMode.dark) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.dark
            .copyWith(systemNavigationBarColor: Colors.black87),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light
            .copyWith(systemNavigationBarColor: Colors.transparent),
      );
    }
    _box.write('theme_mode', themeMode.toString());
    Get.rootController.refresh();
  }
}
