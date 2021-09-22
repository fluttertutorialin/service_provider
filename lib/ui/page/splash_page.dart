import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(controller.settings.appName!,
                style: Get.textTheme.headline6!.merge(const TextStyle(fontSize: 24)))));
  }
}
