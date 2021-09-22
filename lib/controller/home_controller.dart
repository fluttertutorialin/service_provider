import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final page = 1.obs;
  final isLoading = true.obs;
  final isDone = false.obs;
  final currentIndex = 1.obs;

  ScrollController scrollController = ScrollController();

  @override
  Future<void> onInit() async {
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isDone.value) {}
    });
    super.onInit();
  }

  void changeTab(int index) async {
    currentIndex.value = index;
    page.value = 1;
  }
}
