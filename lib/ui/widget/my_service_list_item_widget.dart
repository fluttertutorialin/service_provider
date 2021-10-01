import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../navigation/route_name.dart';
import '../../util/extensions.dart';
import 'booking_options_popup_menu_widget.dart';

class MyServiceListItemWidget extends StatelessWidget {
  const MyServiceListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(RouteName.myServiceDetailRoute);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: getBoxDecoration(),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(children: [
                Hero(
                    tag: '',
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: CachedNetworkImage(
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            imageUrl:  'http://lorempixel.com/400/400/business/4/',
                            placeholder: (context, url) => Image.asset(
                                'assets/icon/icon.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 80),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline)))),
                /*Container(
                    width: 80,
                    child: Text('available'.tr,
                        maxLines: 1,
                        style: Get.textTheme.bodyText2!.merge(const TextStyle(
                            color: Colors.green, height: 1.4, fontSize: 10)),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6)),*/
                Container(
                    width: 80,
                    child: Text('hidden'.tr,
                        maxLines: 1,
                        style: Get.textTheme.bodyText2!.merge(const TextStyle(
                            color: Colors.grey, height: 1.4, fontSize: 10)),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6))
              ]),
              const SizedBox(width: 12),
              Expanded(
                  child: Wrap(
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                    Row(children: [
                      Expanded(
                          child: Text('Ludak Service',
                              style: Get.textTheme.bodyText2, maxLines: 3)),
                      const BookingOptionsPopupMenuWidget()
                    ]),
                    const Divider(height: 8, thickness: 1),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 5,
                              children: [
                                SizedBox(
                                    height: 32,
                                    child: Chip(
                                        padding: const EdgeInsets.all(0),
                                        label: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Icon(Icons.star,
                                                  color: Get.theme.accentColor,
                                                  size: 18),
                                              Text('3.45',
                                                  style: Get
                                                      .textTheme.bodyText2!
                                                      .merge(TextStyle(
                                                          color: Get.theme
                                                              .accentColor,
                                                          height: 1.4)))
                                            ]),
                                        backgroundColor: Get.theme.accentColor
                                            .withOpacity(0.15),
                                        shape: const StadiumBorder())),
                                Text('From (%s)'.trArgs(['44']),
                                    style: Get.textTheme.bodyText1)
                              ]),
                          getPrice(100.00, style: Get.textTheme.headline6)
                        ]),
                    const Divider(height: 8, thickness: 1),
                    Text('Description',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Get.textTheme.caption),
                    Wrap(
                        spacing: 5,
                        children: List.generate(3, (index) {
                          return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 4),
                              child: Text('Car service',
                                  style: Get.textTheme.caption!
                                      .merge(const TextStyle(fontSize: 10))),
                              decoration: BoxDecoration(
                                  color: Get.theme.primaryColor,
                                  border: Border.all(
                                      color: Get.theme.focusColor
                                          .withOpacity(0.2)),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20))));
                        }),
                        runSpacing: 5)
                  ]))
            ])));
  }
}
