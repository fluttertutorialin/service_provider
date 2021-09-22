import 'package:get/get.dart';
import '../navigation/route_name.dart';
import '../model/setting_response.dart';
import '../service/settings_service.dart';

class SplashController extends GetxController {
  final SettingResponse settings = Get.find<SettingsService>().setting.value;

  @override
  void onInit() {
    super.onInit();
    _navigationPage();
  }

  _navigationPage() async => await Future.delayed(const Duration(seconds: 3)).then((value) {
      Get.offAllNamed(RouteName.loginRoute);
    });
}
