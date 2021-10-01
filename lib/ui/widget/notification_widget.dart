import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AuthService _authService = Get.find<AuthService>();
    return Container(
        padding: const EdgeInsets.all(12),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: getBoxDecoration(
            color: Get
                .theme.primaryColor /*Get.theme.focusColor.withOpacity(0.15)*/),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
          Stack(children: <Widget>[
            Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Get.theme.focusColor.withOpacity(1),
                          Get.theme.focusColor.withOpacity(0.2)
                        ])),
                child: Icon(Icons.notifications_outlined,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    size: 50)),
            Positioned(
                right: -15,
                bottom: -30,
                child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150)))),
            Positioned(
                left: -20,
                top: -55,
                child: Container(
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                        color: Theme.of(context)
                            .scaffoldBackgroundColor
                            .withOpacity(0.15),
                        borderRadius: BorderRadius.circular(150))))
          ]),
          const SizedBox(width: 15),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                Text('Notification title',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: Get.textTheme.bodyText1!
                        .merge(const TextStyle(fontWeight: FontWeight.w600))),
                Text('26, February 2021 | 04::34', style: Get.textTheme.caption)
              ]))
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
