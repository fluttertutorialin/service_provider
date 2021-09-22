import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class StatisticCarouselItemWidget extends StatelessWidget {
  final double? marginLeft;

  const StatisticCarouselItemWidget({Key? key, this.marginLeft})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsetsDirectional.only(
            start: marginLeft!, end: 20, top: 25, bottom: 25),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        decoration: getBoxDecoration(color: Get.theme.primaryColor),
        width: 110,
        child: Column(children: [
          Text('00',
              textAlign: TextAlign.center,
              style: Get.textTheme.subtitle1!.merge(const TextStyle(
                  height: 1, fontSize: 18, fontWeight: FontWeight.w600))),
          const SizedBox(height: 8),
          Text('Total Amount',
              textAlign: TextAlign.center,
              maxLines: 3,
              style: Get.textTheme.caption)
        ]));
  }
}
