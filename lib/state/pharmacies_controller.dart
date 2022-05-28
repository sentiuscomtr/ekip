import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_project1/api/service/pharmacies_service.dart';
import 'package:new_project1/model/pharmacy_view_model.dart';

class PharmaciesController extends GetxController {
  final PharmaciesService _pharmaciesService = PharmaciesService();
  RxList<PharmacViewModel> pharmaciesList = RxList<PharmacViewModel>();

  var isLoading = false.obs;
  var customIcon;

  @override
  void onInit() async {
    isLoading(true);
    update();

    await getPharmacies();
    isLoading(false);
    update();

    super.onInit();
  }

  Future getPharmacies() async {
    var response = await _pharmaciesService.getPharmacies();
    if (response is List<PharmacViewModel>) {
      pharmaciesList.value = response;
    } else {
      log('FAILED');
    }
  }
}
