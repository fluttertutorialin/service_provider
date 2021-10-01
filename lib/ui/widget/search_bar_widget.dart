import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'filter_bottom_sheet_widget.dart';
import '../../navigation/route_name.dart';

class SearchBarWidget extends StatelessWidget implements PreferredSize {
  const SearchBarWidget({Key? key}) : super(key: key);

  Widget buildSearchBar() {
    return Hero(
        tag: 'home_search',
        child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                border:
                    Border.all(color: Get.theme.focusColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(10)),
            child: GestureDetector(
                onTap: () {
                  Get.toNamed(RouteName.searchRoute);
                },
                child: Row(children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(right: 12, left: 0),
                      child: Icon(Icons.search, color: Get.theme.accentColor)),
                  Expanded(
                      child: Text('searchHint'.tr,
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.fade,
                          style: Get.textTheme.caption)),
                  const SizedBox(width: 8),
                  GestureDetector(
                      onTap: () {
                        Get.bottomSheet(const FilterBottomSheetWidget(),
                            isScrollControlled: true);
                      },
                      child: Container(
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                              color: Get.theme.focusColor.withOpacity(0.1)),
                          child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 4,
                              children: [
                                Text('filter'.tr,
                                    style: Get.textTheme.bodyText2),
                                Icon(Icons.filter_list,
                                    color: Get.theme.hintColor, size: 21)
                              ])))
                ]))));
  }

  @override
  Widget build(BuildContext context) {
    return buildSearchBar();
  }

  @override
  Widget get child => buildSearchBar();

  @override
  Size get preferredSize => Size(Get.width, 80);
}
