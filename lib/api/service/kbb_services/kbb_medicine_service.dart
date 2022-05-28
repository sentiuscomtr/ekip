import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/kbb_models/save_medicine_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/api/model/request_model/kbb_models/save_recycle_req_model.dart';

class KbbMedicineService {
  Future saveMedicine({required SaveMedicineRequestModel model}) async {
    final uri = Uri.parse(ApiEndpoint.saveMedicine);
    final body = json.encode(model.toJson());
    final headers = {'content-type': 'application/json'};

    final response = await http.post(uri, body: body, headers: headers);
    if (response.statusCode == 200) {
      log('SUCCESSFULL');
      if (response.body == 'SAVED') {
        log('HEYYY');
        return ApiResponseStatus.SAVED;
      }
    } else {
      log('FAILED');
    }
  }

  Future saveRecycle({required SaveRecycleReqModel model}) async {
    final uri = Uri.parse(ApiEndpoint.saveRecycle);
    log(model.toString());
    final body = json.encode(model.toJson());
    final token = GetStorage().read('kbb_token');
    final headers = {
      'content-type': 'application/json',
      'Authorization': 'Bearer KBB/$token'
    };

    final response = await http.post(uri, headers: headers, body: body);
    log('$token');
    log(response.body);

    if (response.statusCode == 200) {
      log('WHAAAT');
      if (response.body == 'ADDED') {
        return ApiResponseStatus.SAVED;
      } else {
        log(response.body);
        return ApiResponseStatus.FAIL;
      }
    }
  }
}

enum ApiResponseStatus { SAVED, FAIL }
