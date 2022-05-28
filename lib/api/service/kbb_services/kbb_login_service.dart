import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'package:new_project1/api/endpoint/endpoint.dart';
import 'package:new_project1/api/model/request_model/kbb_models/kbb_login_request_model.dart';
import 'package:new_project1/constants/api_status_codes.dart';

class KBBLoginService {
  Future<dynamic> login({required KbbLoginRequestModel requestModel}) async {
    final uri = Uri.parse(ApiEndpoint.kbbLogin);
    final body = json.encode(requestModel.toJson());
    final headers = {"content-type": "application/json"};

    final response = await http.post(uri, body: body, headers: headers);
    if (response.statusCode == 200) {
      return LoginStatus.SUCCESSFULL;
    } else {
      log(response.body.toString());
      return LoginStatus.FAILED;
    }
  }
}
