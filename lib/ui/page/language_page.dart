import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../service/translation_service.dart';

class LanguagePage extends GetView<LanguageController> {
  final bool? hideAppBar;

  const LanguagePage({Key? key, this.hideAppBar = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: hideAppBar!
            ? null
            : AppBar(
                title: Text('language'.tr, style: context.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    icon:
                        Icon(Icons.arrow_back, color: Get.theme.hintColor),
                    onPressed: () => Get.back()),
                elevation: 0),
        body: Column(
            children:
                List.generate(TranslationService.languages.length, (index) {
          var _lang = TranslationService.languages.elementAt(index);
          return RadioListTile(
              value: _lang,
              groupValue: Get.locale.toString(),
              onChanged: (value) {
                controller.updateLocale(value);
              },
              title: Text(_lang.tr, style: Get.textTheme.bodyText2));
        }).toList()));
  }
}
