import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../util/extensions.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            decoration: getBoxDecoration(),
            child: Wrap(runSpacing: 20, children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: CachedNetworkImage(
                            height: 65,
                            width: 65,
                            fit: BoxFit.cover,
                            imageUrl:  'http://lorempixel.com/400/400/business/4/',
                            placeholder: (context, url) => Image.asset(
                                'assets/icon/icon.png',
                                fit: BoxFit.cover,
                                height: 65,
                                width: 65),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline))),
                    const SizedBox(width: 15),
                    Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                          Text('Username',
                              overflow: TextOverflow.fade,
                              softWrap: false,
                              maxLines: 2,
                              style: Get.textTheme.bodyText2!.merge(TextStyle(
                                  color: Theme.of(context).hintColor))),
                          Text('Execiation laborum',
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.caption)
                        ])),
                    SizedBox(
                        height: 32,
                        child: Chip(
                            padding: const EdgeInsets.all(0),
                            label: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Text('2.41',
                                      style: Get.textTheme.bodyText1!.merge(
                                          TextStyle(
                                              color: Get.theme.primaryColor))),
                                  Icon(Icons.star_border,
                                      color: Get.theme.primaryColor, size: 16)
                                ]),
                            backgroundColor:
                                Get.theme.accentColor.withOpacity(0.9),
                            shape: const StadiumBorder()))
                  ]),
              Text('',
                  style: Get.textTheme.caption,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  maxLines: 3)
            ])));
  }
}