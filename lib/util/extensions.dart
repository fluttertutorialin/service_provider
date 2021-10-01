import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../service/settings_service.dart';

extension DynamicUtil on dynamic {
  toast({String title = 'Success', String? message}) {
    return GetBar(
        titleText: Text(title.tr,
            style: Get.textTheme.headline6!
                .merge(TextStyle(color: Get.theme.primaryColor))),
        messageText: Text(message!,
            style: Get.textTheme.caption!
                .merge(TextStyle(color: Get.theme.primaryColor))),
        snackPosition: SnackPosition.BOTTOM,
        margin: const EdgeInsets.all(20),
        backgroundColor: Get.theme.accentColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        borderRadius: 8,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        duration: const Duration(seconds: 5));
  }
}

extension ContextExtensions on BuildContext {}

extension InputDecorationExtensions on InputDecoration {

}

extension WidgetExtensions on Widget {
  getBoxDecoration(
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

  getPrice(double? myPrice,
      {TextStyle? style, String zeroPlaceholder = '-', String? unit}) {
    var _setting = Get.find<SettingsService>();

    if (style != null) {
      style = style.merge(TextStyle(fontSize: style.fontSize! + 2));
    }
    try {
      if (myPrice == 0) {
        return Text('-', style: style);
      }
      return RichText(
          softWrap: false,
          overflow: TextOverflow.fade,
          maxLines: 1,
          text: _setting.setting.value.currencyRight != null
              ? TextSpan(
                  text: _setting.setting.value.defaultCurrency,
                  style: getPriceStyle(style!),
                  children: <TextSpan>[
                      TextSpan(
                          text: myPrice?.toStringAsFixed(_setting.setting.value
                                  .defaultCurrencyDecimalDigits!) ??
                              '',
                          style: style),
                      if (unit != null)
                        TextSpan(
                            text: ' ' + unit + ' ',
                            style: getPriceStyle(style)),
                    ])
              : TextSpan(
                  text: myPrice?.toStringAsFixed(_setting
                          .setting.value.defaultCurrencyDecimalDigits!) ??
                      '',
                  style: style,
                  children: <TextSpan>[
                      TextSpan(
                          text: _setting.setting.value.defaultCurrency,
                          style: getPriceStyle(style!)),
                      if (unit != null)
                        TextSpan(text: '0', style: getPriceStyle(style)),
                    ]));
    } catch (e) {
      return const Text('');
    }
  }

  getPriceStyle(TextStyle? style) {
    if (style == null) {
      return Get.textTheme.subtitle2!.merge(
        TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: Get.textTheme.subtitle2!.fontSize! - 6),
      );
    } else {
      return style.merge(TextStyle(
          fontWeight: FontWeight.w400, fontSize: style.fontSize! - 6));
    }
  }
}

extension VoidExtensions on void {
  showProgress() {
    Container(
        alignment: FractionalOffset.center,
        child: const CircularProgressIndicator(strokeWidth: 1));
  }

  void navigationBack() {
    Get.back();
  }
}

extension StringExtensions on void {
  /*String unescapeConvert(String htmlString) {
    var unescape = HtmlUnescape();
    var text = unescape.convert(htmlString);
    return text;
  }*/
}
