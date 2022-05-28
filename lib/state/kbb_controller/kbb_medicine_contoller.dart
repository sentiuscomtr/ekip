import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_medicine_request_model.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_recycle_req_model.dart';
import 'package:new_project1/api/model/request_model/search_med_req_model.dart';
import 'package:new_project1/api/model/response_model/medicine_response_model.dart';
import 'package:new_project1/api/service/kbb_services/kbb_medicine_service.dart';
import 'package:new_project1/api/service/kbb_services/kbb_search_med_service.dart';
import 'package:new_project1/ui/widgets/snackbar/snackbar.dart';

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
    if (res == ApiResponseStatus.SAVED) {
      resetForms();
      Get.back();
      CustomSnackbar.getSnackbar(
          'BASARILI', 'Ilac basariyla eklendi', SnackbarType.SUCCESS);
    }
  }

  TextEditingController medicineId = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController skt = TextEditingController();
  var selectedType = RecycleType.CONSUME.obs;

  Future saveRecycle() async {
    final reqModel = SaveRecycleReqModel(
        medicineId: int.parse(medicineId.text),
        number: int.parse(number.text),
        skt: DateTime.now(),
        type: selectedType.value);

    final response = await _medService.saveRecycle(model: reqModel);
    if (response == ApiResponseStatus.SAVED) {
      CustomSnackbar.getSnackbar(
          'BASARILI', 'Ilac Basariyla Eklendi', SnackbarType.SUCCESS);
    } else {
      CustomSnackbar.getSnackbar(
          'HATA', 'Bir hatayla karsilasildi', SnackbarType.ERROR);
    }
  }

  void selectRecycleType(RecycleType type) {
    selectedType.value = type;
    update();
  }

  void resetForms() {
    medicineList.clear();
    medicineNameTextController.clear();
    medicineSizeTextController.clear();
    keywordTextController.clear();
  }
}
