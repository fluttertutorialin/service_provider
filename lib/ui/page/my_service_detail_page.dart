import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/review_item_widget.dart';
import '../widget/my_service_title_bar_widget.dart';
import '../widget/my_service_til_widget.dart';
import '../../util/extensions.dart';

class MyServiceDetailPage extends StatelessWidget {
  const MyServiceDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(primary: true, shrinkWrap: false, slivers: <
                Widget>[
              SliverAppBar(
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  expandedHeight: 320,
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
                  bottom: _buildEServiceTitleBarWidget(),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Stack(
                          alignment: AlignmentDirectional.bottomCenter,
                          children: <Widget>[
                            _buildCarouselSlider(),
                            _buildCarouselBullets()
                          ])).marginOnly(bottom: 50)),
              SliverToBoxAdapter(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                    const SizedBox(height: 10),
                    buildCategories(),
                    EServiceTilWidget(
                        title: Text('description'.tr,
                            style: Get.textTheme.subtitle2),
                        content: Text('Description',
                            style: Get.textTheme.bodyText1)),
                    EServiceTilWidget(
                        horizontalPadding: 0,
                        title:
                            Text('galleries'.tr, style: Get.textTheme.subtitle2)
                                .paddingSymmetric(horizontal: 20),
                        content: SizedBox(
                            height: 120,
                            child: ListView.builder(
                                primary: false,
                                shrinkWrap: false,
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                      onTap: () {},
                                      child: Container(
                                          width: 100,
                                          height: 100,
                                          margin: EdgeInsetsDirectional.only(
                                              end: 20,
                                              start: index == 0 ? 20 : 0,
                                              top: 10,
                                              bottom: 10),
                                          child: Stack(
                                              alignment:
                                                  AlignmentDirectional.topStart,
                                              children: [
                                                ClipRRect(
                                                    borderRadius: const BorderRadius.all(
                                                        Radius.circular(10)),
                                                    child: CachedNetworkImage(
                                                        height: 100,
                                                        width: double.infinity,
                                                        fit: BoxFit.cover,
                                                        imageUrl:
                                                            'http://lorempixel.com/400/400/business/4/',
                                                        placeholder: (context,
                                                                url) =>
                                                            Image.asset(
                                                                'assets/icon/icon.png',
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: double
                                                                    .infinity,
                                                                height: 100),
                                                        errorWidget: (context,
                                                                url, error) =>
                                                            const Icon(Icons
                                                                .error_outline))),
                                                Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .only(
                                                            start: 12, top: 8),
                                                    child: Text('Name',
                                                        maxLines: 2,
                                                        style: Get.textTheme
                                                            .bodyText2!
                                                            .merge(TextStyle(
                                                                color: Get.theme
                                                                    .primaryColor))))
                                              ])));
                                })),
                        actions: [
                          InkWell(
                            onTap: () {},
                            child: Text('viewAll'.tr,
                                style: Get.textTheme.subtitle1),
                          ).paddingSymmetric(horizontal: 20)
                        ]),
                    EServiceTilWidget(
                        title: Text('reviewAmdRating'.tr,
                            style: Get.textTheme.subtitle2),
                        content: Column(children: [
                          Text('3.45', style: Get.textTheme.headline1),
                          Wrap(children: getStarsList(4.1, size: 32)),
                          Text(
                            'Reviews (%s)'.trArgs(['3.53']),
                            style: Get.textTheme.caption,
                          ).paddingOnly(top: 10),
                          const Divider(height: 35, thickness: 1.3),
                          ListView.separated(
                              padding: const EdgeInsets.all(0),
                              itemBuilder: (context, index) {
                                return const ReviewItemWidget();
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                    height: 35, thickness: 1.3);
                              },
                              itemCount: 10,
                              primary: false,
                              shrinkWrap: true)
                        ]),
                        actions: [
                          InkWell(
                              onTap: () {
                                // Get.offAllNamed(Routes.REGISTER);
                              },
                              child: Text('viewAll'.tr,
                                  style: Get.textTheme.subtitle1))
                        ])
                  ]))
            ])));
  }

  _buildEServiceTitleBarWidget() {
    return MyServiceTitleBarWidget(
        title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
          Row(children: [
            Expanded(
                child: Text('Ludak Service', style: Get.textTheme.headline5)),
            Text('startFrom'.tr, style: Get.textTheme.caption)
          ]),
          Row(children: [
            Expanded(
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.end,
                    children: List.from(getStarsList(4.45))
                      ..addAll([
                        const SizedBox(width: 5),
                        Text(
                          'Reviews (%s)'.trArgs(['4.48']),
                          style: Get.textTheme.caption,
                        )
                      ]))),
            getPrice(
              100.00,
              style: Get.textTheme.headline3!
                  .merge(TextStyle(color: Get.theme.accentColor)),
            )
          ])
        ]));
  }
}

_buildCarouselSlider() {
  return CarouselSlider(
      options: CarouselOptions(
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 7),
        height: 350,
        viewportFraction: 1.0,
        onPageChanged: (index, reason) {

        },
      ),
      items: [
        'http://lorempixel.com/400/400/business/4/',
        'http://lorempixel.com/400/400/business/4/'
      ].map((String url) {
        return Builder(builder: (BuildContext context) {
          return Hero(
              tag: '',
              child: CachedNetworkImage(
                  width: double.infinity,
                  height: 350,
                  fit: BoxFit.cover,
                  imageUrl: url,
                  placeholder: (context, url) => Image.asset(
                      'assets/icon/icon.png',
                      fit: BoxFit.cover,
                      width: double.infinity),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error_outline)));
        });
      }).toList());
}

_buildCarouselBullets() {
  return Container(
      margin: const EdgeInsets.symmetric(vertical: 92, horizontal: 20),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            'http://lorempixel.com/400/400/business/4/',
            'http://lorempixel.com/400/400/business/4/'
          ].map((String url) {
            return Container(
                width: 20.0,
                height: 5.0,
                margin:
                    const EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: 0 == 0
                        ? Get.theme.hintColor
                        : Get.theme.primaryColor.withOpacity(0.4)));
          }).toList()));
}

List<Icon> getStarsList(double rate, {double size = 18}) {
  var list = <Icon>[];
  list = List.generate(rate.floor(), (index) {
    return Icon(Icons.star, size: size, color: const Color(0xFFFFB24D));
  });
  if (rate - rate.floor() > 0) {
    list.add(Icon(Icons.star_half, size: size, color: const Color(0xFFFFB24D)));
  }
  list.addAll(
      List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
    return Icon(Icons.star_border, size: size, color: const Color(0xFFFFB24D));
  }));
  return list;
}

Widget buildCategories() {
  return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 5,
          runSpacing: 8,
          children: List.generate(3, (index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  child: Text('Medical Services', style: Get.textTheme.caption),
                  decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.2),
                      border: Border.all(color: Colors.green.withOpacity(0.1)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                );
              }) +
              List.generate(3, (index) {
                return Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text('Car Service', style: Get.textTheme.caption),
                    decoration: BoxDecoration(
                        color: Get.theme.primaryColor,
                        border: Border.all(
                            color: Get.theme.focusColor.withOpacity(0.2)),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20))));
              })));
}
