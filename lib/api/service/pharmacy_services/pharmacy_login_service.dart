import 'dart:convert';
import 'dart:developer';

import 'package:get_storage/get_storage.dart';
import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/pharmacy_models/pharmacy_login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/constants/api_status_codes.dart';

class PharmacyLoginService {
  Future<dynamic> login(
      {required PharmacyLoginRequestModel requestModel}) async {
    final uri = Uri.parse(ApiEndpoint.pharmacyLogin);
    final body = json.encode(requestModel.toJson());
    final headers = {
      'content-type': 'application/json',
    };

    final res = await http.post(uri, body: body, headers: headers);
    if (res.statusCode == 200) {
      var token = json.decode(res.body)['token'];
      GetStorage().write('token', token);
      log(token);
      return LoginStatus.SUCCESSFULL;
    } else {
      return LoginStatus.FAILED;
    }
  }
}
