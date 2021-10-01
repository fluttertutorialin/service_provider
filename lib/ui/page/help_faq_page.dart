import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/faq_item_widget.dart';

class HelpFaqPage extends StatelessWidget {
  const HelpFaqPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Get.theme.accentColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(color: Get.theme.primaryColor),
            title: Text('helpAndFaQ'.tr,
                style: Get.textTheme.headline6!
                    .merge(TextStyle(color: Get.theme.primaryColor))),
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.primaryColor),
                onPressed: () => Get.back())),
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Text('helpAndSupport'.tr, style: Get.textTheme.headline5),
                  Text('mostFrequentlyAskedQuestions'.tr,
                          style: Get.textTheme.caption)
                      .paddingSymmetric(vertical: 5),
                  ListView.separated(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      primary: false,
                      itemCount: 10,
                      separatorBuilder: (context, index) {
                        return const SizedBox(height: 15);
                      },
                      itemBuilder: (context, indexFaq) {
                        return const FaqItemWidget();
                      })
                ])));
  }
}
