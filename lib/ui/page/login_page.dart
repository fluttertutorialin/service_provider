import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigation/route_name.dart';
import '../component/form_button_widget.dart';
import '../component/text_field_component.dart';
import '../../controller/controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(height: 80),
                  Text(controller.settings.appName!,
                      style: context.textTheme.headline6!
                          .merge(const TextStyle(fontSize: 20)),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 5),
                  Text('splashMessage'.tr,
                      style: context.textTheme.subtitle1!
                          .merge(const TextStyle(fontSize: 13)),
                      textAlign: TextAlign.center),
                  const SizedBox(height: 20),
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image.asset('assets/icon/icon.png',
                          fit: BoxFit.cover, width: 80, height: 80)),
                  const SizedBox(height: 40),
                  _loginFormWidget(),
                  _forgotPasswordWidget(),
                  _loginPress(),
                  _doNotAccountWidget()
                ]))));
  }

  _forgotPasswordWidget() =>
      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        TextButton(onPressed: () {}, child: Text('forgotPassword'.tr))
      ]).paddingSymmetric(horizontal: 0);

  _loginFormWidget() => Column(children: [
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
            textInputAction: TextInputAction.done,
            focusNode: controller.passwordFocusNode,
            obscureText: true),
      ]);

  _loginPress() => FormButtonWidget(
        onPressed: () {
          Get.offNamed(RouteName.mainTabRoute);
        },
        color: Get.theme.accentColor,
        text: Text('login'.tr,
            style: Get.textTheme.headline6!
                .merge(TextStyle(color: Get.theme.primaryColor))),
      ).paddingSymmetric(vertical: 10);

  _doNotAccountWidget() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () {
                Get.toNamed(RouteName.signUpRoute);
              },
              child: Text("don'tHaveAccount".tr))
        ],
      ).paddingSymmetric(vertical: 20);
}
