import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/controller.dart';
import '../../navigation/route_name.dart';
import '../widget/account_link_widget.dart';
import '../../util/extensions.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('account'.tr,
                style: Get.textTheme.headline6!.merge(TextStyle(
                    color: context.theme.primaryColor, fontSize: 18))),
            centerTitle: true,
            backgroundColor: Get.theme.accentColor,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.sort, color: Get.theme.primaryColor),
                onPressed: () => {Scaffold.of(context).openDrawer()}),
            elevation: 0),
        body: ListView(primary: true, children: [
          Stack(alignment: AlignmentDirectional.bottomCenter, children: [
            Container(
                height: 170,
                width: Get.width,
                decoration: BoxDecoration(
                    color: Get.theme.accentColor,
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Get.theme.focusColor.withOpacity(0.2),
                          blurRadius: 10,
                          offset: const Offset(0, 5))
                    ]),
                margin: const EdgeInsets.only(bottom: 50),
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      Text('name'.tr,
                          style: Get.textTheme.headline6!
                              .merge(TextStyle(color: Get.theme.primaryColor))),
                      Text('freelancer'.tr,
                          style: Get.textTheme.caption!
                              .merge(TextStyle(color: Get.theme.primaryColor))),
                      const SizedBox(height: 10),
                      Text('email'.tr,
                          style: Get.textTheme.caption!
                              .merge(TextStyle(color: Get.theme.primaryColor)))
                    ]))),
            Container(
                decoration: getBoxDecoration(
                    radius: 14,
                    border:
                        Border.all(width: 5, color: Get.theme.primaryColor)),
                child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: CachedNetworkImage(
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        imageUrl: 'http://lorempixel.com/400/400/business/4/',
                        placeholder: (context, url) => Image.asset(
                            'assets/icon/icon.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 100),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error_outline))))
          ]),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: getBoxDecoration(),
              child: Column(children: [
                AccountLinkWidget(
                    icon: Icon(Icons.person_outline,
                        color: Get.theme.accentColor),
                    text: Text('profile'.tr),
                    onTap: (e) {
                      Get.toNamed(RouteName.profileRoute);
                    }),
                AccountLinkWidget(
                    icon: Icon(Icons.assignment_outlined,
                        color: Get.theme.accentColor),
                    text: Text('booking'.tr),
                    onTap: (e) {
                      Get.find<MainTabController>().changeTabIndex(0);
                    }),
                AccountLinkWidget(
                    icon: Icon(Icons.notifications_outlined,
                        color: Get.theme.accentColor),
                    text: Text('notification'.tr),
                    onTap: (e) {
                      Get.toNamed(RouteName.notificationRoute);
                    }),
                AccountLinkWidget(
                    icon:
                        Icon(Icons.chat_outlined, color: Get.theme.accentColor),
                    text: Text('message'.tr),
                    onTap: (e) {
                      Get.find<MainTabController>().changeTabIndex(2);
                    })
              ])),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: getBoxDecoration(),
              child: Column(children: [
                AccountLinkWidget(
                    icon: Icon(Icons.translate_outlined,
                        color: Get.theme.accentColor),
                    text: Text('language'.tr),
                    onTap: (e) {
                      Get.toNamed(RouteName.languageRoute);
                    }),
                AccountLinkWidget(
                    icon: Icon(Icons.brightness_6_outlined,
                        color: Get.theme.accentColor),
                    text: Text('themeMode'.tr),
                    onTap: (e) {
                      Get.toNamed(RouteName.themeModeRoute);
                    })
              ])),
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: getBoxDecoration(),
              child: Column(children: [
                AccountLinkWidget(
                    icon: Icon(Icons.support_outlined,
                        color: Get.theme.accentColor),
                    text: Text('helpAndFaQ'.tr),
                    onTap: (e) {
                      Get.toNamed(RouteName.helpFaqRoute);
                    }),
                AccountLinkWidget(
                    icon: Icon(Icons.logout, color: Get.theme.accentColor),
                    text: Text('logout'.tr),
                    onTap: (e) {
                      Get.offNamed(RouteName.loginRoute);
                    })
              ]))
        ]));
  }
}
