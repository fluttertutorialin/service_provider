import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';

class ThemeModePage extends GetView<ThemeModeController> {
  const ThemeModePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('themeMode'.tr, style: context.textTheme.headline6!
                .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back, color: Get.theme.hintColor),
                onPressed: () => Get.back()),
            elevation: 0),
        body: Column(children: [
          Obx(() => RadioListTile(
              value: ThemeMode.light,
              groupValue: controller.selectedThemeMode.value,
              onChanged: (ThemeMode? value) {
                controller.changeThemeMode(value!);
              },
              title: Text('lightTheme'.tr, style: Get.textTheme.bodyText2))),
          Obx(() => RadioListTile(
              value: ThemeMode.dark,
              groupValue: controller.selectedThemeMode.value,
              onChanged: (ThemeMode? value) {
                controller.changeThemeMode(value!);
              },
              title: Text('darkTheme'.tr, style: Get.textTheme.bodyText2))),
          Obx(() => RadioListTile(
              value: ThemeMode.system,
              groupValue: controller.selectedThemeMode.value,
              onChanged: (ThemeMode? value) {
                controller.changeThemeMode(value!);
              },
              title: Text('systemTheme'.tr, style: Get.textTheme.bodyText2)))
        ]));
  }
}
