import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/filter_bottom_sheet_widget.dart';
import '../widget/search_services_list_item_widget.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('search'.tr, style: context.textTheme.headline6!.merge(const TextStyle(
                fontSize: 18))),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                onPressed: () => Get.back()),
            elevation: 0),
        body: ListView(children: [
          buildSearchBar(),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            primary: false,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: ((_, index) {
              return const SearchServicesListItemWidget();
            }),
          )
        ]));
  }

  Widget buildSearchBar() {
    return Hero(
        tag: '',
        child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
            decoration: BoxDecoration(
                color: Get.theme.primaryColor,
                border:
                    Border.all(color: Get.theme.focusColor.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(10)),
            child: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 0),
                child: Icon(Icons.search, color: Get.theme.accentColor),
              ),
              Expanded(
                  child: Material(
                      color: Get.theme.primaryColor,
                      child: TextField(
                          style: Get.textTheme.bodyText2,
                          onSubmitted: (value) {},
                          autofocus: true,
                          cursorColor: Get.theme.focusColor,
                          decoration: getInputDecoration(
                              hintText: 'searchHint'.tr)))),
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
                            Text('filter'.tr, style: Get.textTheme.bodyText2),
                            Icon(Icons.filter_list,
                                color: Get.theme.hintColor, size: 21)
                          ])))
            ])));
  }

  InputDecoration getInputDecoration(
      {String hintText = '', IconData? iconData, Widget? suffixIcon}) {
    return InputDecoration(
        hintText: hintText,
        hintStyle: Get.textTheme.caption,
        prefixIcon: iconData != null
            ? Icon(iconData, color: Get.theme.focusColor).marginOnly(right: 14)
            : const SizedBox(),
        prefixIconConstraints: iconData != null
            ? const BoxConstraints.expand(width: 38, height: 38)
            : const BoxConstraints.expand(width: 0, height: 0),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        contentPadding: const EdgeInsets.all(0),
        border: const OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none),
        suffixIcon: suffixIcon);
  }
}
