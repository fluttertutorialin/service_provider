import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../service/settings_service.dart';
import '../component/statistic_carousel_item_widget.dart';
import '../component/tab_bar_widget.dart';
import '../widget/bookings_item_widget.dart';
import '../../controller/controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(
                controller: controller.scrollController,
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      expandedHeight: 290,
                      elevation: 0.5,
                      floating: false,
                      iconTheme: IconThemeData(color: Get.theme.primaryColor),
                      title: Text(
                          Get.find<SettingsService>().setting.value.appName!,
                          style: Get.textTheme.headline6!
                              .merge(const TextStyle(fontSize: 18))),
                      centerTitle: true,
                      automaticallyImplyLeading: false,
                      leading: IconButton(
                          icon: const Icon(Icons.sort, color: Colors.black87),
                          onPressed: () => {Scaffold.of(context).openDrawer()}),
                      //actions: [NotificationsButtonWidget()],
                      bottom: TabBarWidget(tabs: [
                        ChipWidget(
                            text: 'statusOnGoing'.tr,
                            id: 0,
                            onSelected: (id) {
                              controller.changeTab(id);
                            }),
                        ChipWidget(
                            text: 'statusCompleted'.tr,
                            id: 1,
                            onSelected: (id) {
                              controller.changeTab(id);
                            }),
                        ChipWidget(
                            text: 'statusArchived'.tr,
                            id: 2,
                            onSelected: (id) {
                              controller.changeTab(id);
                            })
                      ]),
                      flexibleSpace: FlexibleSpaceBar(
                          collapseMode: CollapseMode.parallax,
                          background: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 3,
                              itemBuilder: (BuildContext context, int index) {
                                double _marginLeft = 0;
                                (index == 0)
                                    ? _marginLeft = 20
                                    : _marginLeft = 0;
                                return StatisticCarouselItemWidget(
                                        marginLeft: _marginLeft)
                                    .paddingOnly(top: 70, bottom: 50);
                              }))),
                  SliverToBoxAdapter(
                      child: Wrap(children: [
                    ListView.builder(
                        padding: const EdgeInsets.only(bottom: 10, top: 10),
                        primary: false,
                        shrinkWrap: true,
                        itemCount: 15,
                        itemBuilder: (BuildContext context, int index) {
                          return BookingsItemWidget();
                        })
                  ]))
                ])));
  }
}
