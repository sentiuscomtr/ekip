import 'dart:convert';

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/pharmacy_models/pharmacy_login_request_model.dart';
import 'package:new_project1/api/model/request_model/phone_login_request_model.dart';
import 'package:http/http.dart' as http;
import 'package:new_project1/api/model/request_model/user_login_request_model.dart';
import 'package:new_project1/constants/api_status_codes.dart';
import 'package:get_storage/get_storage.dart';

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
      return LoginStatus.SUCCESSFULL;
    } else {
      return LoginStatus.FAILED;
    }
  }
}
