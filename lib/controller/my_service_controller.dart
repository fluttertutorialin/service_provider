import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/ui.dart';
import '../../../models/e_service_model.dart';
import '../../../models/user_model.dart';
import '../../../repositories/e_provider_repository.dart';
import '../../../services/auth_service.dart';

enum CategoryFilter { ALL, AVAILABILITY, RATING, FEATURED, POPULAR }

class EServicesController extends GetxController {
  User user;
  final selected = Rx<CategoryFilter>();
  final eServices = <EService>[].obs;
  final page = 1.obs;
  final isLoading = true.obs;
  final isDone = false.obs;
  EProviderRepository _eProviderRepository;
  ScrollController scrollController = ScrollController();

  EServicesController() {
    user = Get.find<AuthService>().user.value;
    _eProviderRepository = new EProviderRepository();
  }

  @override
  Future<void> onInit() async {
    selected.value = CategoryFilter.ALL;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isDone.value) {
        loadMoreEServicesOfCategory(filter: selected.value);
      }
    });
    await refreshEServices();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
  }

  Future refreshEServices({bool showMessage}) async {
    await getEServicesOfCategory(filter: selected.value);
    if (showMessage == true) {
      Get.showSnackbar(Ui.SuccessSnackBar(
          message: "List of services refreshed successfully".tr));
    }
  }

  bool isSelected(CategoryFilter filter) => selected == filter;

  void toggleSelected(CategoryFilter filter) {
    isDone.value = false;
    page.value = 1;
    if (isSelected(filter)) {
      selected.value = CategoryFilter.ALL;
    } else {
      selected.value = filter;
    }
  }

  Future getEServicesOfCategory({CategoryFilter filter}) async {
    try {
      eServices.value = [];
      switch (filter) {
        case CategoryFilter.ALL:
          this.page.value = 1;
          eServices.value = await _eProviderRepository
              .getEServicesWithPagination(user.id, page: 1);
          break;
        case CategoryFilter.FEATURED:
          eServices.value =
              await _eProviderRepository.getFeaturedEServices(user.id);
          break;
        case CategoryFilter.POPULAR:
          eServices.value =
              await _eProviderRepository.getPopularEServices(user.id);
          break;
        case CategoryFilter.RATING:
          eServices.value =
              await _eProviderRepository.getMostRatedEServices(user.id);
          break;
        case CategoryFilter.AVAILABILITY:
          eServices.value =
              await _eProviderRepository.getAvailableEServices(user.id);
          break;
        default:
          eServices.value = [];
      }
    } catch (e) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    }
  }

  Future loadMoreEServicesOfCategory({CategoryFilter filter}) async {
    try {
      isLoading.value = true;
      switch (filter) {
        case CategoryFilter.ALL:
          this.page.value++;
          var _eServices = await await _eProviderRepository
              .getEServicesWithPagination(user.id, page: this.page.value);
          if (_eServices.isNotEmpty) {
            this.eServices.value += _eServices;
          } else {
            this.isDone.value = true;
          }
          break;
        case CategoryFilter.FEATURED:
          eServices.value =
              await _eProviderRepository.getFeaturedEServices(user.id);
          break;
        case CategoryFilter.POPULAR:
          eServices.value =
              await _eProviderRepository.getPopularEServices(user.id);
          break;
        case CategoryFilter.RATING:
          eServices.value =
              await _eProviderRepository.getMostRatedEServices(user.id);
          break;
        case CategoryFilter.AVAILABILITY:
          eServices.value =
              await _eProviderRepository.getAvailableEServices(user.id);
          break;
        default:
          eServices.value = [];
      }
    } catch (e) {
      this.isDone.value = true;
      Get.showSnackbar(Ui.ErrorSnackBar(message: e.toString()));
    } finally {
      isLoading.value = false;
    }
  }
}
