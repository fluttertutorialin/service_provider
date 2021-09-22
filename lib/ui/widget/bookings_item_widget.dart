import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'booking_options_popup_menu_widget.dart';
import '../../navigation/route_name.dart';
import '../../util/extensions.dart';

class BookingsItemWidget extends StatelessWidget {
  const BookingsItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Get.toNamed(RouteName.bookingRoute);
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: getBoxDecoration(color: Get.theme.primaryColor),
            child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Column(children: [
                Hero(
                    tag: '1',
                    child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)),
                        child: CachedNetworkImage(
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                            imageUrl:
                                'http://lorempixel.com/400/400/business/4/',
                            placeholder: (context, url) => Image.asset(
                                'assets/icon/icon.png',
                                fit: BoxFit.cover,
                                width: double.infinity,
                                height: 80),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline)))),
                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0)),
                    child: Container(
                        width: 80,
                        child: Column(children: [
                          Text('13:11',
                              maxLines: 1,
                              style: Get.textTheme.bodyText2!.merge(TextStyle(
                                  color: Get.theme.primaryColor, height: 1.4)),
                              softWrap: false,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade),
                          Text('05',
                              maxLines: 1,
                              style: Get.textTheme.headline3!.merge(TextStyle(
                                  color: Get.theme.primaryColor, height: 1)),
                              softWrap: false,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade),
                          Text('Nov',
                              maxLines: 1,
                              style: Get.textTheme.bodyText2!.merge(TextStyle(
                                  color: Get.theme.primaryColor, height: 1)),
                              softWrap: false,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.fade)
                        ]),
                        decoration: BoxDecoration(
                            color: Get.theme.accentColor,
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(10),
                                bottomLeft: Radius.circular(10))),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 6)))
              ]),
              const SizedBox(width: 12),
              Expanded(
                  child: Wrap(
                      runSpacing: 10,
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                    Row(children: [
                      Expanded(
                          child: Text('onboid Service',
                              style: Get.textTheme.bodyText2, maxLines: 3)),
                      const BookingOptionsPopupMenuWidget()
                    ]),
                    const Divider(height: 8, thickness: 1),
                    Row(children: [
                      Icon(Icons.person_outline,
                          size: 18, color: Get.theme.focusColor),
                      const SizedBox(width: 5),
                      Flexible(
                          child: Text('Hess Barker',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Get.textTheme.bodyText1))
                    ]),
                    Row(children: [
                      Icon(Icons.place_outlined,
                          size: 18, color: Get.theme.focusColor),
                      const SizedBox(width: 5),
                      Flexible(
                          child: Text('Address',
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              style: Get.textTheme.bodyText1))
                    ]),
                    const Divider(height: 8, thickness: 1),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Text('Total'.tr,
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  softWrap: false,
                                  style: Get.textTheme.bodyText1)),
                          Expanded(
                              flex: 1,
                              child: Align(
                                  alignment: AlignmentDirectional.centerEnd,
                                  child: getPrice(145.01,
                                      style: Get.textTheme.headline6)))
                        ])
                  ]))
            ])));
  }
}

