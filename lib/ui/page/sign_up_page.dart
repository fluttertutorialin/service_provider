import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigation/route_name.dart';
import '../../controller/controller.dart';
import '../component/form_button_widget.dart';
import '../component/text_field_component.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Padding(
    padding: const EdgeInsets.all(20),
    child: SingleChildScrollView(
        child: Column(children: [
          const SizedBox(height: 80),
          ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: Image.asset('assets/icon/icon.png',
                  fit: BoxFit.cover, width: 80, height: 80)),
          const SizedBox(height: 40),
          TextFieldComponent(
              labelText: 'name'.tr,
              controller: controller.nameController,
              textInputAction: TextInputAction.next,
              focusNode: controller.nameFocusNode,
              keyboardType: TextInputType.text),
          const SizedBox(height: 15),
          TextFieldComponent(
              labelText: 'email'.tr,
              controller: controller.emailController,
              textInputAction: TextInputAction.next,
              focusNode: controller.emailFocusNode,
              keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 15),
          TextFieldComponent(
              labelText: 'password'.tr,
              controller: controller.passwordController,
              textInputAction: TextInputAction.next,
              focusNode: controller.passwordFocusNode,
              obscureText: true),
          const SizedBox(height: 15),
          TextFieldComponent(
              labelText: 'confirmPassword'.tr,
              controller: controller.confirmPasswordController,
              textInputAction: TextInputAction.next,
              focusNode: controller.confirmPasswordFocusNode,
              keyboardType: TextInputType.text),
          const SizedBox(height: 15),
          TextFieldComponent(
              labelText: 'mobile'.tr,
              controller: controller.mobileController,
              textInputAction: TextInputAction.done,
              focusNode: controller.mobileFocusNode,
              obscureText: true),
          const SizedBox(height: 15),
          FormButtonWidget(
            onPressed: () {
              Get.offNamed(RouteName.mainTabRoute);
            },
            color: Get.theme.accentColor,
            text: Text('signUp'.tr,
                style: Get.textTheme.headline6!
                    .merge(TextStyle(color: Get.theme.primaryColor))),
          ).paddingSymmetric(vertical: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(onPressed: () {
                Get.back();
              }, child: Text('alreadyAccount'.tr))
            ],
          ).paddingSymmetric(vertical: 20)
        ]))));
  }
}
