import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatTypeView extends StatelessWidget {
  final _myListKey = GlobalKey<AnimatedListState>();

  ChatTypeView({Key? key}) : super(key: key);

  Widget chatList() {
    return ListView.builder(
        key: _myListKey,
        reverse: true,
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        itemCount: 10,
        shrinkWrap: false,
        primary: true,
        itemBuilder: (context, index) {
          return index % 2 == 0
              ? getSentMessageLayout()
              : getReceivedMessageLayout();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () {
                  Get.back();
                }),
            automaticallyImplyLeading: false,
            title: Text('chat'.tr,
                overflow: TextOverflow.fade,
                maxLines: 1,
                style: Get.textTheme.headline6!
                    .merge(const TextStyle(letterSpacing: 1.3)))),
        body: Column(mainAxisSize: MainAxisSize.max, children: <Widget>[
          Expanded(child: chatList()),
          Container(
              decoration:
                  BoxDecoration(color: Get.theme.primaryColor, boxShadow: [
                BoxShadow(
                    color: Theme.of(context).hintColor.withOpacity(0.10),
                    offset: const Offset(0, -4),
                    blurRadius: 10)
              ]),
              child: TextField(
                  style: Get.textTheme.bodyText1,
                  decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(20),
                      hintText: 'message'.tr,
                      hintStyle: TextStyle(
                          color: Get.theme.focusColor.withOpacity(0.8)),
                      suffixIcon: IconButton(
                          padding: const EdgeInsets.only(right: 30),
                          onPressed: () {},
                          icon: Icon(Icons.send_outlined,
                              color: Get.theme.accentColor, size: 30)),
                      border: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none),
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide.none))))
        ]));
  }

  Widget getSentMessageLayout() {
    return Align(
        alignment: Alignment.centerRight,
        child: Container(
            decoration: BoxDecoration(
                color: Get.theme.focusColor.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                        Text('Lynn potts',
                            style: Get.textTheme.bodyText1!.merge(
                                const TextStyle(fontWeight: FontWeight.w600))),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: const Text('Hi'))
                      ])),
                  Container(
                      margin: const EdgeInsets.only(left: 8.0),
                      width: 42,
                      height: 42,
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(42)),
                          child: CachedNetworkImage(
                              width: double.infinity,
                              fit: BoxFit.cover,
                              imageUrl: '',
                              placeholder: (context, url) => Image.asset(
                                  'assets/img/loading.gif',
                                  fit: BoxFit.cover,
                                  width: double.infinity),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error_outline))))
                ])));
  }

  Widget getReceivedMessageLayout() {
    return Align(
        alignment: Alignment.centerLeft,
        child: Container(
            decoration: BoxDecoration(
                color: Get.theme.accentColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15))),
            padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
            margin: const EdgeInsets.symmetric(vertical: 5),
            child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: const EdgeInsets.only(right: 10),
                      width: 42,
                      height: 42,
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(42)),
                          child: CachedNetworkImage(
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl: '',
                            placeholder: (context, url) => Image.asset(
                                'assets/img/loading.gif',
                                fit: BoxFit.cover,
                                width: double.infinity),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error_outline),
                          ))),
                  Flexible(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                        Text('Hess barker',
                            style: Get.textTheme.bodyText1!.merge(TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Get.theme.primaryColor))),
                        Container(
                            margin: const EdgeInsets.only(top: 5.0),
                            child: Text('Hi',
                                style:
                                    TextStyle(color: Get.theme.primaryColor)))
                      ]))
                ])));
  }
}
