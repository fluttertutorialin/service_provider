import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/notification_widget.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('notification'.tr,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => {Get.back()})),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: ListView(primary: true, children: <Widget>[
              Text('Incoming Notification'.tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text('swipeDeleteLeft'.tr, style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              notificationsList()
            ])));
  }

  Widget notificationsList() {
    return ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) {
          return const SizedBox(height: 7);
        },
        shrinkWrap: true,
        primary: false,
        itemBuilder: (context, index) {
          return const NotificationWidget();
        });
  }
}
