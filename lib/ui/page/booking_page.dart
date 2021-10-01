import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/booking_row_widget.dart';
import '../widget/booking_til_widget.dart';
import '../widget/booking_title_bar_widget.dart';
import '../../util/extensions.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: Get.theme.focusColor.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5))
              ]),
          child: Row(children: [
            Expanded(
                child: MaterialButton(
                    elevation: 0,
                    onPressed: () {},
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    color: Get.theme.accentColor,
                    child: Text('accept'.tr,
                        style: Get.textTheme.bodyText2!
                            .merge(TextStyle(color: Get.theme.primaryColor))))),
            const SizedBox(width: 10),
            MaterialButton(
                elevation: 0,
                onPressed: () {},
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Get.theme.hintColor.withOpacity(0.1),
                child: Text('decline'.tr, style: Get.textTheme.bodyText2))
          ]).paddingSymmetric(vertical: 10, horizontal: 20),
        ),
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(primary: true, shrinkWrap: false, slivers: <
                Widget>[
              SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 370,
                  elevation: 0,
                  // pinned: true,
                  floating: true,
                  iconTheme: IconThemeData(color: Get.theme.primaryColor),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Get.theme.hintColor),
                      onPressed: () => {Get.back()}),
                  actions: [
                    MaterialButton(
                        elevation: 0,
                        onPressed: () {},
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        color: Get.theme.accentColor,
                        child: Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 5,
                            children: [
                              Icon(Icons.map_outlined,
                                  color: Get.theme.primaryColor),
                              Text('onMap'.tr,
                                  style: Get.textTheme.bodyText2!.merge(
                                      TextStyle(color: Get.theme.primaryColor)))
                            ])).paddingSymmetric(horizontal: 20, vertical: 8),
                  ],
                  bottom: _buildBookingTitleBarWidget(),
                  flexibleSpace: FlexibleSpaceBar(
                    collapseMode: CollapseMode.parallax,
                    background: Container(),
                  ).marginOnly(bottom: 60)),
              SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    _buildContactCustomer(),
                    BookingTilWidget(
                        title: Text('bookingDetails'.tr,
                            style: Get.textTheme.subtitle2),
                        content: Column(children: [
                          BookingRowWidget(
                              description: 'bookingRef'.tr,
                              value: 'c6783dd68',
                              hasDivider: true),
                          BookingRowWidget(
                              description: 'progress'.tr,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(
                                            right: 12,
                                            left: 12,
                                            top: 6,
                                            bottom: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            color: Get.theme.focusColor
                                                .withOpacity(0.1)),
                                        child: Text('statusCompleted'.tr,
                                            style: TextStyle(
                                                color: Get.theme.hintColor)))
                                  ]),
                              hasDivider: true),
                          BookingRowWidget(
                              description: 'paymentMethod'.tr,
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                        padding: const EdgeInsets.only(
                                            right: 12,
                                            left: 12,
                                            top: 6,
                                            bottom: 6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5)),
                                            color: Get.theme.focusColor
                                                .withOpacity(0.1)),
                                        child: Text('Paypal',
                                            style: TextStyle(
                                                color: Get.theme.hintColor)))
                                  ]),
                              hasDivider: true),
                          BookingRowWidget(
                              description: 'taxAmount'.tr,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: getPrice(18.00,
                                      style: Get.textTheme.bodyText2))),
                          BookingRowWidget(
                              description: 'totalAmount'.tr,
                              child: Align(
                                  alignment: Alignment.centerRight,
                                  child: getPrice(145.86,
                                      style: Get.textTheme.headline6)),
                              hasDivider: true),
                          BookingRowWidget(
                              description: 'description'.tr,
                              value: 'Ipsum ad anim ullamco deserunt')
                        ]))
                  ]))
            ])));
  }

  _buildBookingTitleBarWidget() {
    return BookingTitleBarWidget(
        title: Row(children: [
          Flexible(
              fit: FlexFit.tight,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text('Orboid Service', style: Get.textTheme.headline5),
                    Row(children: [
                      Icon(Icons.person_outline, size: 20, color: Get.theme.focusColor),
                      const SizedBox(width: 8),
                      Text('Hess Barker',
                          style: Get.textTheme.bodyText1,
                          maxLines: 1,
                          overflow: TextOverflow.fade)
                    ]),
                    Row(children: [
                      Icon(Icons.place_outlined, size: 20, color: Get.theme.focusColor),
                      const SizedBox(width: 8),
                      Expanded(
                          child: Text('626 Meadow Street, Eagletowm, Michigan, 3705',
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Get.textTheme.bodyText1))
                    ])
                  ])),
          const SizedBox(width: 8),
          Container(
              width: 80,
              child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text('13:31',
                    maxLines: 1,
                    style: Get.textTheme.bodyText2!
                        .merge(TextStyle(color: Get.theme.accentColor, height: 1.4)),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                Text('05',
                    maxLines: 1,
                    style: Get.textTheme.headline3!
                        .merge(TextStyle(color: Get.theme.accentColor, height: 1)),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                Text('Nov',
                    maxLines: 1,
                    style: Get.textTheme.bodyText2!
                        .merge(TextStyle(color: Get.theme.accentColor, height: 1)),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade)
              ]),
              decoration: BoxDecoration(
                  color: Get.theme.accentColor.withOpacity(0.2),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6))
        ]));
  }

  _buildContactCustomer() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: getBoxDecoration(),
        child: Row(children: [
          Expanded(
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('contactCustomer'.tr, style: Get.textTheme.subtitle2),
                Text('+1 (980) 438-2388', style: Get.textTheme.caption)
              ])),
          Wrap(spacing: 5, children: [
            MaterialButton(
                elevation: 0,
                onPressed: () {
                  //controller.saveProfileForm(_profileForm);
                },
                height: 44,
                minWidth: 44,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Get.theme.accentColor.withOpacity(0.2),
                child: Icon(Icons.phone_android_outlined,
                    color: Get.theme.accentColor)),
            MaterialButton(
                elevation: 0,
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Get.theme.accentColor.withOpacity(0.2),
                padding: EdgeInsets.zero,
                height: 44,
                minWidth: 44,
                child: Icon(Icons.chat_outlined, color: Get.theme.accentColor))
          ])
        ]));
  }
}



