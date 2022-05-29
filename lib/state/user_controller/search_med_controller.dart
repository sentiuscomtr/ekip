import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_project1/api/model/request_model/search_med_req_model.dart';
import 'package:new_project1/api/model/response_model/medicine_response_model.dart';
import 'package:new_project1/api/service/kbb_services/kbb_search_med_service.dart';

class SearchMedController extends GetxController {
  SearchMedicineService _searchMedicineService = SearchMedicineService();
  TextEditingController keywordTextController = TextEditingController();

  RxList<MedicineResponseModel> searchResult = <MedicineResponseModel>[].obs;

  @override
  onInit() async {}

  Future search() async {
    final reqModel = SearchMedReqModel(keyword: keywordTextController.text);
    final response = await _searchMedicineService.searchMed(reqModel: reqModel);
    if (response is List<MedicineResponseModel>) {
      searchResult.clear();
      for (var element in response) {
        searchResult.add(element);
        update();
      }
    }
  }
}
