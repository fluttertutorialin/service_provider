import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum CategoryFilter { all, availability, rating, featured, popular }

class MyServiceController extends GetxController {
  final selected = Rx<CategoryFilter>(CategoryFilter.all);
  ScrollController scrollController = ScrollController();

  @override
  void onClose() {
    scrollController.dispose();
  }

  bool isSelected(CategoryFilter filter) => selected.value == filter;

  void toggleSelected(CategoryFilter filter) {
    selected.value = filter;
  }
}
