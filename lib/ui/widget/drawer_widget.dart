import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'drawer_link_widget.dart';
import '../../controller/controller.dart';
import '../../navigation/route_name.dart';
import '../../service/settings_service.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      GestureDetector(
          onTap: () {
            //currentUser.value.apiToken != null ? Navigator.of(context).pushNamed('/Profile') : Navigator.of(context).pushNamed('/Login');
          },
          child: Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
              decoration: BoxDecoration(
                  color: Theme.of(context).hintColor.withOpacity(0.1)),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Welcome'.tr,
                        style: Get.textTheme.headline5!
                            .merge(TextStyle(color: Get.theme.accentColor))),
                    const SizedBox(height: 5),
                    Text('loginCreateNewAccountFree'.tr,
                        style: Get.textTheme.bodyText1),
                    const SizedBox(height: 15),
                    Wrap(spacing: 10, children: <Widget>[
                      MaterialButton(
                          elevation: 0,
                          onPressed: () {
                            Get.offAndToNamed(RouteName.loginRoute);
                          },
                          color: Get.theme.accentColor,
                          height: 40,
                          child: Wrap(
                              runAlignment: WrapAlignment.center,
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 9,
                              children: [
                                Icon(Icons.exit_to_app_outlined,
                                    color: Get.theme.primaryColor, size: 24),
                                Text('login'.tr,
                                    style: Get.textTheme.subtitle1!.merge(
                                        TextStyle(
                                            color: Get.theme.primaryColor)))
                              ]),
                          shape: const StadiumBorder()),
                      MaterialButton(
                        elevation: 0,
                        color: Get.theme.focusColor.withOpacity(0.2),
                        height: 40,
                        onPressed: () {
                          Get.offAllNamed(RouteName.signUpRoute);
                        },
                        child: Wrap(
                            runAlignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 9,
                            children: [
                              Icon(Icons.person_add_outlined,
                                  color: Get.theme.hintColor, size: 24),
                              Text('signUp'.tr,
                                  style: Get.textTheme.subtitle1!.merge(
                                      TextStyle(color: Get.theme.hintColor)))
                            ]),
                        shape: const StadiumBorder(),
                      )
                    ])
                  ]))),
      const SizedBox(height: 20),
      DrawerLinkWidget(
          icon: Icons.assignment_outlined,
          text: 'booking',
          onTap: (e) {
            Get.back();
            Get.find<MainTabController>().changeTabIndex(0);
          }),
      DrawerLinkWidget(
          icon: Icons.folder_special_outlined,
          text: 'myService',
          onTap: (e) {
            Get.back();
            Get.toNamed(RouteName.myServiceRoute);
          }),
      DrawerLinkWidget(
          icon: Icons.notifications_none_outlined,
          text: 'notification',
          onTap: (e) {
            Get.back();
            Get.toNamed(RouteName.notificationRoute);
          }),
      DrawerLinkWidget(
          icon: Icons.chat_outlined,
          text: 'message',
          onTap: (e) {
            Get.back();
            Get.find<MainTabController>().changeTabIndex(2);
          }),
      ListTile(
          dense: true,
          title: Text('applicationPreference'.tr, style: Get.textTheme.caption),
          trailing:
              Icon(Icons.remove, color: Get.theme.focusColor.withOpacity(0.3))),
      DrawerLinkWidget(
          icon: Icons.person_outline,
          text: 'account',
          onTap: (e) {
            Get.back();
            Get.find<MainTabController>().changeTabIndex(3);
          }),
      DrawerLinkWidget(
          icon: Icons.settings_outlined,
          text: 'profile',
          onTap: (e) {
            Get.back();
            Get.toNamed(RouteName.profileRoute);
          }),
      DrawerLinkWidget(
          icon: Icons.translate_outlined,
          text: 'language',
          onTap: (e) {
            Get.back();
            Get.toNamed(RouteName.languageRoute);
          }),
      DrawerLinkWidget(
          icon: Icons.brightness_6_outlined,
          text: Get.isDarkMode ? 'lightTheme' : 'darkTheme',
          onTap: (e) {
            Get.back();
            Get.toNamed(RouteName.themeModeRoute);
          }),
      ListTile(
          dense: true,
          title: Text('helpPrivacy', style: Get.textTheme.caption),
          trailing:
              Icon(Icons.remove, color: Get.theme.focusColor.withOpacity(0.3))),
      DrawerLinkWidget(
          icon: Icons.help_outline, text: 'helpAndFaQ', onTap: (e) {}),
      DrawerLinkWidget(
          icon: Icons.privacy_tip_outlined,
          text: 'privacyPolicy',
          onTap: (e) {}),
      DrawerLinkWidget(
          icon: Icons.logout,
          text: 'logout',
          onTap: (e) {
            Get.offNamed(RouteName.loginRoute);
          }),
      if (Get.find<SettingsService>().setting.value.enableVersion != null)
        ListTile(
            dense: true,
            title: Text(
              'version'.tr +
                  ' ' +
                  Get.find<SettingsService>().setting.value.appVersion!,
              style: Get.textTheme.caption,
            ),
            trailing: Icon(Icons.remove,
                color: Get.theme.focusColor.withOpacity(0.3)))
    ]));
  }
}
