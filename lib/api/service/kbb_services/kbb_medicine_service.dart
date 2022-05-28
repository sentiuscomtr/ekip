import 'dart:convert';
import 'dart:developer';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_medicine_request_model.dart';
import 'package:http/http.dart' as http;

class KbbMedicineService {
  Future saveMedicine({required SaveMedicineRequestModel model}) async {
    final uri = Uri.parse(ApiEndpoint.saveMedicine);
    final body = json.encode(model.toJson());
    final headers = {'content-type': 'application/json'};

    final response = await http.post(uri, body: body, headers: headers);
    if (response.statusCode == 200) {
      log('SUCCESSFULL');
    } else {
      log('FAILED');
    }
  }
}
