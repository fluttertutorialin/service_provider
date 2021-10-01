import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/my_service_list_item_widget.dart';
import '../../controller/controller.dart';
import '../widget/search_bar_widget.dart';

class MyServicePage extends GetView<MyServiceController> {
  const MyServicePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(shrinkWrap: false, slivers: <Widget>[
              SliverAppBar(
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                  expandedHeight: 140,
                  elevation: 0.5,
                  primary: true,
                  pinned: false,
                  floating: true,
                  iconTheme: IconThemeData(color: Get.theme.primaryColor),
                  title: Text('myService'.tr,
                      style: Get.textTheme.headline6!.merge(TextStyle(
                          color: Get.theme.primaryColor, fontSize: 18))),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Get.theme.primaryColor),
                      onPressed: () => {Get.back()}),
                  bottom: const SearchBarWidget(),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 75),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Get.theme.accentColor.withOpacity(1),
                                  Get.theme.accentColor.withOpacity(0.2)
                                ],
                                begin: AlignmentDirectional.topStart,
                                //const FractionalOffset(1, 0),
                                end: AlignmentDirectional.bottomEnd,
                                stops: const [0.1, 0.9],
                                tileMode: TileMode.clamp),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5))),
                      )).marginOnly(bottom: 42)),
              SliverToBoxAdapter(
                  child: Wrap(children: [
                SizedBox(
                    height: 60,
                    child: ListView(
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(CategoryFilter.values.length,
                            (index) {
                          var _filter = CategoryFilter.values.elementAt(index);
                          return Obx(() {
                            return Padding(
                                padding:
                                    const EdgeInsetsDirectional.only(start: 20),
                                child: RawChip(
                                    elevation: 0,
                                    label: Text(_filter.toString().tr),
                                    labelStyle: controller.isSelected(_filter)
                                        ? Get.textTheme.bodyText2!.merge(
                                            TextStyle(
                                                color: Get.theme.primaryColor))
                                        : Get.textTheme.bodyText2,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12, vertical: 15),
                                    backgroundColor:
                                        Get.theme.focusColor.withOpacity(0.1),
                                    selectedColor: Get.theme.accentColor,
                                    selected: controller.isSelected(_filter),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    showCheckmark: true,
                                    checkmarkColor: Get.theme.primaryColor,
                                    onSelected: (bool value) {
                                      controller.toggleSelected(_filter);
                                      controller.toggleSelected(_filter);
                                    }));
                          });
                        }))),
                ListView.builder(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    primary: false,
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: ((_, index) {
                      return const MyServiceListItemWidget();
                    }))
              ]))
            ])));
  }
}
