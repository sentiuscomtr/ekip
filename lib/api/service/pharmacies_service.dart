import 'dart:convert';
import 'dart:developer';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/api/model/response_model/drug_store_response_model.dart';
import 'package:new_project1/constants/api_status_codes.dart';
import 'package:new_project1/model/pharmacy_view_model.dart';

class PharmaciesService {
  Future<dynamic> getPharmacies() async {
    final uri = Uri.parse(ApiEndpoint.getPharmacies);
    final response = await http.get(uri);
    log(response.statusCode.toString());
    if (response.statusCode == 200) {
      var body = json.decode(utf8.decode(response.bodyBytes));
      var pharmcyList = <PharmacViewModel>[];
      body.forEach((element) {
        pharmcyList
            .add(PharmacViewModel(model: DrugStoreResponseModel(map: element)));
      });

      return pharmcyList;
    } else {
      log('FAILED');
      return RequestStatus.FAILED;
    }
  }

  Future getDutyPharmacy() async {
    final uri = Uri.parse(ApiEndpoint.getDutyPharmacies);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      var body = json.decode(utf8.decode(response.bodyBytes));
      var dutyPharmacies = <PharmacViewModel>[];
      body.forEach((element) {
        dutyPharmacies
            .add(PharmacViewModel(model: DrugStoreResponseModel(map: element)));
      });

      return dutyPharmacies;
    } else {
      log('FAILED');
      return RequestStatus.FAILED;
    }
  }
}
