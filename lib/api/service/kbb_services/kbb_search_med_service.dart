import 'dart:convert';
import 'dart:developer';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/core/page.dart';
import 'package:new_project1/api/model/request_model/search_med_req_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/api/model/response_model/medicine_response_model.dart';

class SearchMedicineService {
  Future<dynamic> searchMed({required SearchMedReqModel reqModel}) async {
    final uri = Uri.parse(ApiEndpoint.searchMed + '?' + reqModel.read());
    final headers = {"content-type": "application/json"};
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      var page = BasePage(map: json.decode(response.body));
      log(response.body);
      List<MedicineResponseModel> list = [];

      page.content.forEach((element) {
        list.add(MedicineResponseModel(map: element));
      });

      return list;
    } else {
      log('SEARCH FAILED');
    }
  }
}
