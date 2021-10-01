import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'page.dart';
import '../widget/drawer_widget.dart';
import '../../controller/controller.dart';

class MainTabPage extends GetView<MainTabController> {
  const MainTabPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainTabController>(builder: (controller) {
      return Scaffold(
          drawer: const Drawer(child: DrawerWidget(), elevation: 0),
          body: IndexedStack(index: controller.tabIndex, children: const [
            HomePage(),
            ReviewPage(),
            ChatPage(),
            AccountPage()
          ]),
          bottomNavigationBar: BottomNavigationBar(
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: const Icon(Icons.home_outlined, size: 24),
                    label: 'home'.tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.star, size: 24),
                    label: 'ratting'.tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.chat_bubble_outline, size: 24),
                    label: 'chat'.tr),
                BottomNavigationBarItem(
                    icon: const Icon(Icons.person_outline, size: 24),
                    label: 'profile'.tr)
              ],
              backgroundColor: context.theme.scaffoldBackgroundColor,
              currentIndex: controller.tabIndex,
              selectedItemColor: context.theme.accentColor,
              onTap: (index) => controller.changeTabIndex(index),
              type: BottomNavigationBarType.fixed));
    });
  }
}
