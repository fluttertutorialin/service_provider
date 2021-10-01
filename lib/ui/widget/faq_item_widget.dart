import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FaqItemWidget extends StatelessWidget {
  const FaqItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: getBoxDecoration(),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Question', style: Get.textTheme.bodyText2),
              const Divider(height: 30, thickness: 1),
              Text('Answer', style: Get.textTheme.bodyText1)
            ]));
  }

  BoxDecoration getBoxDecoration(
      {Color? color, double? radius, Border? border, Gradient? gradient}) {
    return BoxDecoration(
        color: color ?? Get.theme.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(radius ?? 10)),
        boxShadow: [
          BoxShadow(
              color: Get.theme.focusColor.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5))
        ],
        border:
            border ?? Border.all(color: Get.theme.focusColor.withOpacity(0.05)),
        gradient: gradient);
  }
}
