import '../service/settings_service.dart';
import '../controller/controller.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' show Bindings;

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => SettingsService());
  }
}
