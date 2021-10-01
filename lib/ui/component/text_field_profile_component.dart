import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      this.labelText,
      this.isFirst,
      this.isLast,
      this.iconData,
      this.suffixIcon})
      : super(key: key);

  final String? labelText;
  final bool? isFirst;
  final bool? isLast;
  final IconData? iconData;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(top: 20, bottom: 14, left: 20, right: 20),
        margin: EdgeInsets.only(
            left: 20, right: 20, top: topMargin, bottom: bottomMargin),
        decoration: BoxDecoration(
            color: Get.theme.primaryColor,
            borderRadius: buildBorderRadius,
            boxShadow: [
              BoxShadow(
                  color: Get.theme.focusColor.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5))
            ],
            border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(labelText ?? '',
              style: Get.textTheme.bodyText1, textAlign: TextAlign.start),
          TextFormField(
              keyboardType: TextInputType.text,
              style: Get.textTheme.bodyText2,
              textAlign: TextAlign.start,
              decoration: getInputDecoration(
                iconData: iconData,
                suffixIcon: suffixIcon,
              )),
        ]));
  }

  BorderRadius get buildBorderRadius {
    if (isFirst != null && isFirst!) {
      return const BorderRadius.vertical(top: Radius.circular(10));
    }
    if (isLast != null && isLast!) {
      return const BorderRadius.vertical(bottom: Radius.circular(10));
    }
    if (isFirst != null && !isFirst! && isLast != null && !isLast!) {
      return const BorderRadius.all(Radius.circular(0));
    }
    return const BorderRadius.all(Radius.circular(10));
  }

  double get topMargin {
    if ((isFirst != null && isFirst!)) {
      return 20;
    } else if (isFirst == null) {
      return 20;
    } else {
      return 0;
    }
  }

  double get bottomMargin {
    if ((isLast != null && isLast!)) {
      return 10;
    } else if (isLast == null) {
      return 10;
    } else {
      return 0;
    }
  }

  static InputDecoration getInputDecoration(
      {String hintText = '', IconData? iconData, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: Get.textTheme.caption,
      prefixIcon: iconData != null
          ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
          : const SizedBox(),
      prefixIconConstraints: iconData != null
          ? const BoxConstraints.expand(width: 38, height: 38)
          : const BoxConstraints.expand(width: 0, height: 0),
      floatingLabelBehavior: FloatingLabelBehavior.never,
      contentPadding: const EdgeInsets.all(0),
      border: const OutlineInputBorder(borderSide: BorderSide.none),
      focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
      suffixIcon: suffixIcon,
    );
  }
}
