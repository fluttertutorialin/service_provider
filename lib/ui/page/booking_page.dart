import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:map_launcher/map_launcher.dart' as launcher;

import '../../../../common/ui.dart';
import '../../../global_widgets/circular_loading_widget.dart';
import '../../../models/address_model.dart';
import '../../../models/booking_model.dart';
import '../controllers/booking_controller.dart';
import '../widgets/booking_row_widget.dart';
import '../widgets/booking_til_widget.dart';
import '../widgets/booking_title_bar_widget.dart';

class BookingView extends GetView<BookingController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      var _booking = controller.booking.value;
      if (!_booking.hasData) {
        return Scaffold(
          body: CircularLoadingWidget(height: Get.height),
        );
      } else {
        return Scaffold(
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Get.theme.primaryColor,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(color: Get.theme.focusColor.withOpacity(0.1), blurRadius: 10, offset: Offset(0, -5)),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    elevation: 0,
                    onPressed: () {
                      // TODO Accept booking
                      //controller.saveProfileForm(_profileForm);
                    },
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    color: Get.theme.accentColor,
                    child: Text("Accept".tr, style: Get.textTheme.bodyText2.merge(TextStyle(color: Get.theme.primaryColor))),
                  ),
                ),
                SizedBox(width: 10),
                MaterialButton(
                  elevation: 0,
                  onPressed: () {
                    // TODO decline booking
                    // controller.resetProfileForm(_profileForm);
                  },
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  color: Get.theme.hintColor.withOpacity(0.1),
                  child: Text("Decline".tr, style: Get.textTheme.bodyText2),
                ),
              ],
            ).paddingSymmetric(vertical: 10, horizontal: 20),
          ),
          body: RefreshIndicator(
              onRefresh: () async {
                controller.refreshBooking(showMessage: true);
              },
              child: CustomScrollView(
                primary: true,
                shrinkWrap: false,
                slivers: <Widget>[
                  SliverAppBar(
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    expandedHeight: 370,
                    elevation: 0,
                    // pinned: true,
                    floating: true,
                    iconTheme: IconThemeData(color: Get.theme.primaryColor),
                    centerTitle: true,
                    automaticallyImplyLeading: false,
                    leading: new IconButton(
                      icon: new Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
                      onPressed: () => {Get.back()},
                    ),
                    actions: [
                      MaterialButton(
                        elevation: 0,
                        onPressed: () => openMapsSheet(context, _booking.address, _booking.id),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        color: Get.theme.accentColor,
                        child: Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 5,
                          children: [
                            Icon(Icons.map_outlined, color: Get.theme.primaryColor),
                            Text("On Maps".tr, style: Get.textTheme.bodyText2.merge(TextStyle(color: Get.theme.primaryColor))),
                          ],
                        ),
                      ).paddingSymmetric(horizontal: 20, vertical: 8),
                    ],
                    bottom: buildBookingTitleBarWidget(_booking),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Obx(() {
                        return GoogleMap(
                          compassEnabled: false,
                          scrollGesturesEnabled: false,
                          tiltGesturesEnabled: false,
                          myLocationEnabled: false,
                          myLocationButtonEnabled: false,
                          zoomControlsEnabled: false,
                          zoomGesturesEnabled: false,
                          mapToolbarEnabled: false,
                          rotateGesturesEnabled: false,
                          liteModeEnabled: true,
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(target: LatLng(0, 0)),
                          markers: Set.from(controller.allMarkers),
                          onMapCreated: (GoogleMapController _con) {
                            controller.mapController = _con;
                          },
                        );
                      }),
                    ).marginOnly(bottom: 60),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        buildContactCustomer(_booking),
                        BookingTilWidget(
                          title: Text("Booking Details".tr, style: Get.textTheme.subtitle2),
                          content: Column(
                            children: [
                              BookingRowWidget(description: "Booking Ref".tr, value: "#" + _booking.id.substring(15), hasDivider: true),
                              BookingRowWidget(
                                  description: "Progress".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          _booking.progress,
                                          style: TextStyle(color: Get.theme.hintColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                  description: "Payment Method".tr,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(right: 12, left: 12, top: 6, bottom: 6),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                          color: Get.theme.focusColor.withOpacity(0.1),
                                        ),
                                        child: Text(
                                          _booking.paymentMethod.name,
                                          style: TextStyle(color: Get.theme.hintColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  hasDivider: true),
                              BookingRowWidget(
                                description: "Tax Amount".tr,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Ui.getPrice(_booking.tax, style: Get.textTheme.bodyText2),
                                ),
                              ),
                              BookingRowWidget(
                                description: "Total Amount".tr,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: Ui.getPrice(_booking.total, style: Get.textTheme.headline6),
                                ),
                                hasDivider: true,
                              ),
                              BookingRowWidget(description: "Description".tr, value: _booking.description),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        );
      }
    });
  }

  BookingTitleBarWidget buildBookingTitleBarWidget(Booking _booking) {
    return BookingTitleBarWidget(
      title: Row(
        children: [
          Flexible(
            fit: FlexFit.tight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  _booking.eService?.title ?? '',
                  style: Get.textTheme.headline5,
                ),
                Row(
                  children: [
                    Icon(Icons.person_outline, color: Get.theme.focusColor),
                    SizedBox(width: 8),
                    Text(
                      _booking.user.name,
                      style: Get.textTheme.bodyText1,
                      maxLines: 1,
                      overflow: TextOverflow.fade,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.place_outlined, color: Get.theme.focusColor),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(_booking.address.address, maxLines: 2, overflow: TextOverflow.ellipsis, style: Get.textTheme.bodyText1),
                    ),
                  ],
                  // spacing: 8,
                  // crossAxisAlignment: WrapCrossAlignment.center,
                ),
              ],
            ),
          ),
          Container(
            width: 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(DateFormat('HH:mm').format(_booking.dateTime),
                    maxLines: 1,
                    style: Get.textTheme.bodyText2.merge(
                      TextStyle(color: Get.theme.accentColor, height: 1.4),
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                Text(DateFormat('dd').format(_booking.dateTime),
                    maxLines: 1,
                    style: Get.textTheme.headline3.merge(
                      TextStyle(color: Get.theme.accentColor, height: 1),
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
                Text(DateFormat('MMM').format(_booking.dateTime),
                    maxLines: 1,
                    style: Get.textTheme.bodyText2.merge(
                      TextStyle(color: Get.theme.accentColor, height: 1),
                    ),
                    softWrap: false,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.fade),
              ],
            ),
            decoration: BoxDecoration(
              color: Get.theme.accentColor.withOpacity(0.2),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
          ),
        ],
      ),
    );
  }

  Container buildContactCustomer(Booking _booking) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: Ui.getBoxDecoration(),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Contact Customer".tr, style: Get.textTheme.subtitle2),
                Text(_booking.user?.phone ?? '', style: Get.textTheme.caption),
              ],
            ),
          ),
          Wrap(
            spacing: 5,
            children: [
              MaterialButton(
                elevation: 0,
                onPressed: () {
                  //controller.saveProfileForm(_profileForm);
                },
                height: 44,
                minWidth: 44,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Get.theme.accentColor.withOpacity(0.2),
                child: Icon(
                  Icons.phone_android_outlined,
                  color: Get.theme.accentColor,
                ),
              ),
              MaterialButton(
                elevation: 0,
                onPressed: () {
                  //controller.saveProfileForm(_profileForm);
                },
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                color: Get.theme.accentColor.withOpacity(0.2),
                padding: EdgeInsets.zero,
                height: 44,
                minWidth: 44,
                child: Icon(
                  Icons.chat_outlined,
                  color: Get.theme.accentColor,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  openMapsSheet(context, Address address, String _title) async {
    try {
      final coords = launcher.Coords(address.getLatLng().latitude, address.getLatLng().longitude);
      final title = _title ?? "";
      final availableMaps = await launcher.MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                        onTap: () => map.showDirections(
                          directionsMode: launcher.DirectionsMode.driving,
                          destinationTitle: title,
                          destination: coords,
                        ),
                        title: Text(map.mapName, style: Get.textTheme.bodyText2),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
}
