import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookingOptionsPopupMenuWidget extends StatelessWidget {
  const BookingOptionsPopupMenuWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        elevation: 8,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        onSelected: (item) {
          switch (item) {
            case 'accept':
              {
                // TODO accept the booking
              }
              break;
            case 'decline':
              {
                // TODO decline the booking
              }
              break;
            case 'view':
              {}
              break;
          }
        },
        itemBuilder: (context) {
          var list = <PopupMenuEntry<Object>>[];
          list.add(PopupMenuItem(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(Icons.assignment_outlined, color: Get.theme.hintColor),
                    Text('viewDetail'.tr,
                        style: TextStyle(color: Get.theme.hintColor))
                  ]),
              value: 'view'));
          list.add(const PopupMenuDivider(height: 10));
          list.add(PopupMenuItem(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    Icon(Icons.check_circle_outline,
                        color: Get.theme.hintColor),
                    Text('accept'.tr,
                        style: TextStyle(color: Get.theme.hintColor))
                  ]),
              value: 'accept'));
          list.add(PopupMenuItem(
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: [
                    const Icon(Icons.remove_circle_outline,
                        color: Colors.redAccent),
                    Text('decline'.tr,
                        style: const TextStyle(color: Colors.redAccent))
                  ]),
              value: 'decline'));
          return list;
        },
        child: Icon(Icons.more_vert, color: Get.theme.hintColor));
  }
}
