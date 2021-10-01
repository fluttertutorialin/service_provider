import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class SearchServicesListItemWidget extends StatelessWidget {
  const SearchServicesListItemWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
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
                        style: Get.textTheme.bodyText2!.merge(
                          const TextStyle(
                              color: Colors.green, height: 1.4, fontSize: 10),
                        ),
                        softWrap: false,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.fade),
                    decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10))),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 6)),*/
                Container(
                    width: 80,
                    child: Text('offline'.tr,
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
                      Text('Title', style: Get.textTheme.bodyText2, maxLines: 3)
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
                                            Text('0.0',
                                                style: Get.textTheme.bodyText2!
                                                    .merge(TextStyle(
                                                        color: Get
                                                            .theme.accentColor,
                                                        height: 1.4)))
                                          ]),
                                      backgroundColor: Get.theme.accentColor
                                          .withOpacity(0.15),
                                      shape: const StadiumBorder(),
                                    )),
                                Text('From (%s)'.trArgs(['0.1']),
                                    style: Get.textTheme.bodyText1)
                              ]),
                          getPrice(20.99, style: Get.textTheme.headline6)
                        ]),
                    Row(children: [
                      Icon(
                        Icons.home_work_outlined,
                        size: 18,
                        color: Get.theme.focusColor,
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                          child: Text('Name',
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
                    Wrap(
                        spacing: 5,
                        children: List.generate(3, (index) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            child: Text('Service name',
                                style: Get.textTheme.caption!
                                    .merge(const TextStyle(fontSize: 10))),
                            decoration: BoxDecoration(
                                color: Get.theme.primaryColor,
                                border: Border.all(
                                    color:
                                        Get.theme.focusColor.withOpacity(0.2)),
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(20))),
                          );
                        }),
                        runSpacing: 5)
                  ]))
            ])));
  }
}
