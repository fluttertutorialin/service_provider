import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../component/text_field_profile_component.dart';

class ProfilePage extends StatelessWidget {
  final GlobalKey<FormState> _profileForm = GlobalKey<FormState>();

  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('profile'.tr, style: context.textTheme.headline6!.merge(const TextStyle(
                fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => Get.back()),
            elevation: 0),
        bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                      color: Get.theme.focusColor.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, -5))
                ]),
            child: Row(
              children: [
                Expanded(
                    child: MaterialButton(
                        elevation: 0,
                        onPressed: () {},
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Get.theme.accentColor,
                        child: Text('save'.tr,
                            style: Get.textTheme.bodyText2!.merge(
                                TextStyle(color: Get.theme.primaryColor))))),
                const SizedBox(width: 10),
                MaterialButton(
                    elevation: 0,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Get.theme.hintColor.withOpacity(0.1),
                    child: Text('reset'.tr, style: Get.textTheme.bodyText2))
              ],
            ).paddingSymmetric(vertical: 10, horizontal: 20)),
        body: Form(
            key: _profileForm,
            child: ListView(primary: true, children: [
              Text('profileDetails'.tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text('changeFollowingDetailSaveThem'.tr,
                      style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              TextFieldWidget(
                  iconData: Icons.person_outline, labelText: 'name'.tr),
              TextFieldWidget(
                  iconData: Icons.email_outlined, labelText: 'email'.tr),
              TextFieldWidget(
                  iconData: Icons.phone_android_outlined,
                  labelText: 'mobile'.tr),
              TextFieldWidget(
                  iconData: Icons.map_outlined, labelText: 'address'.tr),
              Text('changePassword'.tr, style: Get.textTheme.headline5)
                  .paddingOnly(top: 25, bottom: 0, right: 22, left: 22),
              Text('fillOldPasswordNewPasswordConfirmIt'.tr,
                      style: Get.textTheme.caption)
                  .paddingSymmetric(horizontal: 22, vertical: 5),
              TextFieldWidget(
                  iconData: Icons.lock_outline,
                  labelText: 'oldPassword'.tr,
                  isFirst: true,
                  isLast: false),
              TextFieldWidget(
                  iconData: Icons.lock_outline,
                  labelText: 'newPassword'.tr,
                  isFirst: false,
                  isLast: false),
              TextFieldWidget(
                  iconData: Icons.lock_outline,
                  labelText: 'confirmNewPassword'.tr,
                  isFirst: false,
                  isLast: true)
            ])));
  }
}
