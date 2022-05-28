import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_medicine_request_model.dart';
import 'package:new_project1/api/model/request_model/search_med_req_model.dart';
import 'package:new_project1/api/model/response_model/medicine_response_model.dart';
import 'package:new_project1/api/service/kbb_services/kbb_medicine_service.dart';
import 'package:new_project1/api/service/user_services/find_medicine_service.dart';

class KbbMedicineController extends GetxController {
  final SearchMedicineService _searchService = SearchMedicineService();
  final KbbMedicineService _medService = KbbMedicineService();
  TextEditingController keywordTextController = TextEditingController();
  RxList<MedicineResponseModel> medicineList = <MedicineResponseModel>[].obs;

  TextEditingController medicineNameTextController = TextEditingController();
  TextEditingController medicineSizeTextController = TextEditingController();

  @override
  void onInit() {
    log('ASD');
    super.onInit();
  }

  Future searchMedicine() async {
    log('SEARCH MEDICINE CALLED');
    final reqModel = SearchMedReqModel(keyword: keywordTextController.text);
    final response = await _searchService.searchMed(reqModel: reqModel);
    if (response is List<MedicineResponseModel>) {
      medicineList.clear();
      for (var element in response) {
        medicineList.add(element);
        update();
      }
    } else {
      log('FAILED');
    }
  }

  Future saveMedicine() async {
    final reqModel = SaveMedicineRequestModel(
        name: medicineNameTextController.text,
        size: int.parse(medicineSizeTextController.text));
    final res = await _medService.saveMedicine(model: reqModel);
  }
}
