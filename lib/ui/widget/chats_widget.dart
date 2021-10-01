import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:service_provider/navigation/route_name.dart';

class ChatsWidget extends StatelessWidget {
  const ChatsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Get.toNamed(RouteName.chatTypeViewRoute);
        },
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            decoration: getBoxDecoration(
                color: Get.theme
                    .primaryColor), //Get.theme.accentColor.withOpacity(0.05)
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Stack(children: <Widget>[
                    SizedBox(
                        width: 60,
                        height: 60,
                        child: ClipRRect(
                            borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                            child: CachedNetworkImage(
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl:  'http://lorempixel.com/400/400/business/4/',
                              placeholder: (context, url) => Image.asset(
                                  'assets/icon/icon.png',
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  height: 140),
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error_outline),
                            ))),
                    Positioned(
                        bottom: 3,
                        right: 3,
                        width: 12,
                        height: 12,
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle)))
                  ]),
                  const SizedBox(width: 15),
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Row(children: [
                              Expanded(
                                  child: Text('Landry Company',
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: Get.textTheme.bodyText1!.merge(
                                          const TextStyle(
                                              fontWeight: FontWeight.w400)))),
                              Text('10:06',
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Get.textTheme.caption)
                            ]),
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Expanded(
                                      child: Text('Your response very fast.',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 2,
                                          style: Get.textTheme.caption!.merge(
                                              const TextStyle(
                                                  fontWeight:
                                                  FontWeight.w400)))),
                                  Text('16-09-2021',
                                      overflow: TextOverflow.fade,
                                      softWrap: false,
                                      style: Get.textTheme.caption)
                                ])
                          ]))
                ])));
  }
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
