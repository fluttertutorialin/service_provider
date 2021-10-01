import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widget/review_widget.dart';

class ReviewPage extends StatelessWidget {
  const ReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator(
            onRefresh: () async {},
            child: CustomScrollView(primary: true, shrinkWrap: false, slivers: <
                Widget>[
              SliverAppBar(
                  backgroundColor: Get.theme.scaffoldBackgroundColor,
                  expandedHeight: 200,
                  elevation: 0.5,
                  primary: true,
                  // pinned: true,
                  floating: true,
                  iconTheme: IconThemeData(color: Get.theme.hintColor),
                  title: Text('ratting'.tr,
                      style: Get.textTheme.headline6!.merge(
                          TextStyle(color: Get.theme.hintColor, fontSize: 18))),
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                      icon: Icon(Icons.sort, color: Get.theme.hintColor),
                      onPressed: () => {Scaffold.of(context).openDrawer()}),
                  flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      background: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(top: 75),
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: [
                                    Get.theme.accentColor.withOpacity(1),
                                    Get.theme.scaffoldBackgroundColor
                                  ],
                                  begin: AlignmentDirectional.topCenter,
                                  //const FractionalOffset(1, 0),
                                  end: AlignmentDirectional.bottomCenter,
                                  stops: const [0.1, 0.7],
                                  tileMode: TileMode.clamp),
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5))),
                          child: Column(children: [
                            Text('4.5',
                                style: Get.textTheme.headline1!.merge(TextStyle(
                                    color: Get.theme.hintColor,
                                    fontSize: 36,
                                    fontWeight: FontWeight.w600))),
                            Wrap(children: getStarsList(4.5, size: 32)),
                            Text(
                              'Total Reviews (%s)'.trArgs(['36']),
                              style: Get.textTheme.caption,
                            ).paddingOnly(top: 5)
                          ])))),
              SliverToBoxAdapter(
                  child: ListView.builder(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const ReviewWidget();
                },
                itemCount: 10,
                primary: false,
                shrinkWrap: true,
              ))
            ])));
  }

  List<Icon> getStarsList(double rate, {double size = 18}) {
    var list = <Icon>[];
    list = List.generate(rate.floor(), (index) {
      return Icon(Icons.star, size: size, color: const Color(0xFFFFB24D));
    });
    if (rate - rate.floor() > 0) {
      list.add(
          Icon(Icons.star_half, size: size, color: const Color(0xFFFFB24D)));
    }
    list.addAll(
        List.generate(5 - rate.floor() - (rate - rate.floor()).ceil(), (index) {
      return Icon(Icons.star_border,
          size: size, color: const Color(0xFFFFB24D));
    }));
    return list;
  }
}
