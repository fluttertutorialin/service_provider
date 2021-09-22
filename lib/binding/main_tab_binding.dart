import 'package:get/get.dart';
import '../ui/component/tab_bar_widget.dart';
import '../controller/controller.dart';

class MainTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MainTabController());

    Get.lazyPut(() => TabBarController());
    Get.lazyPut(() => HomeController());
  }
}
