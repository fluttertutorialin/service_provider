import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../model/setting_response.dart';
import '../service/settings_service.dart';

class LoginController extends GetxController{
  final SettingResponse settings = Get.find<SettingsService>().setting.value;

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
}