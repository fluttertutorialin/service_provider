import 'package:get/get.dart';
import '../controller/controller.dart';

class MyServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyServiceController());
  }
}
